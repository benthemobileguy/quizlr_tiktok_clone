import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizlr_tiktok_clone/core/constants/palette.dart';
import 'package:quizlr_tiktok_clone/features/home/presentation/components/header.dart';
import 'package:quizlr_tiktok_clone/features/home/presentation/components/slide_items.dart';
import 'package:quizlr_tiktok_clone/features/home/presentation/cubit/following_cubit.dart';
import 'package:quizlr_tiktok_clone/features/home/presentation/cubit/for_you_cubit.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late final Controller controller;
  int initialPageList = 1;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    fetchData(context);
    controller = Controller()
      ..addListener((event) {
        _handleCallbackEvent(event.direction, event.success, context);
      });
  }

  @override
  void dispose() {
    super.dispose();
    controller.disposeListeners();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<FollowingCubit, FollowingCubitState>(
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Palette.background1,
                  Palette.background2,
                ],
                stops: [0.0, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                HeaderHomePage(
                  tabController: tabController,
                ),
                Expanded(
                  child: TikTokStyleFullPageScroller(
                    controller: controller,
                    swipePositionThreshold: 0.2,
                    swipeVelocityThreshold: 2000,
                    animationDuration: const Duration(milliseconds: 400),
                    builder: (BuildContext context, int index) {
                      return SlideItems(
                        size: size,
                        tabController: tabController,
                        name: (state is FollowingCubitInitial &&
                                state.following.user != null)
                            ? state.following.user!.name.toString()
                            : '',
                        comments: '20',
                        likes: '20',
                        shares: '21',
                        profileImg: (state is FollowingCubitInitial &&
                                state.following.user != null)
                            ? state.following.user!.avatar.toString()
                            : '',
                        flipImg: 'assets/images/flip.png',
                      );
                    },
                    contentSize: initialPageList + 1,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontSize: 10),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
        currentIndex: 0,
        onTap: (int index) {},
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_4),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _handleCallbackEvent(
      ScrollDirection direction, ScrollSuccess success, BuildContext context) {
    if (success == ScrollSuccess.SUCCESS &&
        direction == ScrollDirection.FORWARD) {
      fetchData(context);
      setState(() {
        initialPageList++;
      });
    }
  }

  void fetchData(BuildContext context) {
    context.read<FollowingCubit>().fetchFollowing();
    context.read<ForYouCubit>().fetchForYou();
  }
}
