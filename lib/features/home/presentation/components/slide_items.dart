import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizlr_tiktok_clone/core/constants/palette.dart';
import 'package:quizlr_tiktok_clone/core/utils/toast.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/entities/for_you.dart';
import 'package:quizlr_tiktok_clone/features/home/presentation/components/flash_question.dart';
import 'package:quizlr_tiktok_clone/features/home/presentation/components/header.dart';
import 'package:quizlr_tiktok_clone/features/home/presentation/components/left_pane.dart';
import 'package:quizlr_tiktok_clone/features/home/presentation/components/right_pane.dart';
import 'package:quizlr_tiktok_clone/features/home/presentation/cubit/following_cubit.dart';
import 'package:quizlr_tiktok_clone/features/home/presentation/cubit/for_you_cubit.dart';
import 'package:quizlr_tiktok_clone/features/home/presentation/cubit/reveal_answer_cubit.dart';

class SlideItems extends StatefulWidget {
  const SlideItems({
    Key? key,
    required this.size,
    required this.name,
    required this.comments,
    required this.likes,
    required this.shares,
    required this.profileImg,
    required this.flipImg,
  }) : super(key: key);

  final Size size;
  final String name;
  final String comments;
  final String likes;
  final String shares;
  final String profileImg;
  final String flipImg;

  @override
  State<SlideItems> createState() => _SlideItemsState();
}

class _SlideItemsState extends State<SlideItems>
    with SingleTickerProviderStateMixin {
  bool isShowingPlaying = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: widget.size.width,
        height: widget.size.height,
        child: Stack(
          children: [
            BlocBuilder<FollowingCubit, FollowingCubitState>(
              builder: (context, state) {
                if (state is FollowingCubitLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                } else {
                  return TabBarView(
                    controller: _tabController,
                    children: [
                      FlashQuestion(
                        question: ((state as FollowingCubitInitial)
                            .following
                            .flashcardFront
                            .toString()),
                      ),
                      BlocBuilder<ForYouCubit, ForYouState>(
                        builder: (context, state) {
                          if (state is ForYouCubitLoading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            );
                          } else {
                            final options =
                                (state as ForYouCubitInitial).forYou.options;
                            return Container(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 60),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    (state).forYou.question.toString(),
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18.5,
                                      height: 1.2,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.15),
                                  Column(
                                    children: options != null
                                        ? options.map((option) {
                                            return buildClickableCard(
                                                (state).forYou.id.toString(),
                                                option,
                                                false);
                                          }).toList()
                                        : [],
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  );
                }
              },
            ),
            SizedBox(
              width: widget.size.width,
              height: widget.size.height,
              child: SafeArea(
                child: Column(
                  children: [
                    HeaderHomePage(
                      tabController: _tabController,
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          LeftPanel(
                            size: widget.size,
                            name: widget.name,
                            content: 'Topic 5.2: Manifest Destiny',
                          ),
                          RightPanel(
                            size: widget.size,
                            comments: widget.comments,
                            likes: widget.likes,
                            shares: widget.shares,
                            profileImg: widget.profileImg,
                            flipImg: widget.flipImg,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            //const FlashQuestion(),
            // const FlashQuestionDetails(),
          ],
        ),
      ),
    );
  }

  Widget buildClickableCard(String id, Options option, bool isSelected) {
    var btnBgColor = Palette.bgButton.withOpacity(0.2);
    String? correctAnswer = '';
    return BlocBuilder<RevealAnswerCubit, RevealAnswerState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            context.read<RevealAnswerCubit>().fetchAnswer(id);
            final answer = (state as RevealAnswerInitial).answer;
            correctAnswer = 'Answer: ${answer.correctOptions?[0].answer}';
            ToastUtils.showToast(
              message: correctAnswer ?? 'Error, try again',
              duration: ToastDuration.long,
              gravity: ToastGravity.center,
              backgroundColor: Palette.orange,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
          child: Container(
            height: 60,
            margin: const EdgeInsets.symmetric(vertical: 5),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color:
                  isSelected ? Palette.bgButton.withOpacity(0.5) : btnBgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              option.answer ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.5,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
