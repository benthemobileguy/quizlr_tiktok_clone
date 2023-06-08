import 'package:flutter/material.dart';
import 'package:quizlr_tiktok_clone/core/constants/palette.dart';
import 'package:quizlr_tiktok_clone/core/resources/font_manager.dart';
import 'package:quizlr_tiktok_clone/core/resources/string_manager.dart';
import 'package:quizlr_tiktok_clone/core/resources/values_manager.dart';
import 'package:timer_builder/timer_builder.dart';

class HeaderHomePage extends StatefulWidget {
  final TabController tabController;
  const HeaderHomePage({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  State<HeaderHomePage> createState() => _HeaderHomePageState();
}

class _HeaderHomePageState extends State<HeaderHomePage> {
  late Duration _elapsedTime;
  @override
  void initState() {
    super.initState();
    _elapsedTime = Duration.zero;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: AppPadding.p30),
      color: Palette.black,
      child: Row(
        children: [
          const SizedBox(width: AppSize.s4),
          Icon(
            Icons.timer,
            color: Colors.white.withOpacity(0.6),
          ),
          const SizedBox(width: AppPadding.p3),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.20,
            child: Opacity(
              opacity: 0.6,
              child: TimerBuilder.periodic(
                const Duration(seconds: 1),
                builder: (context) {
                  _elapsedTime += const Duration(seconds: 1);
                  final formattedTime =
                      '${_elapsedTime.inMinutes.toString().padLeft(2, '0')}m ${(_elapsedTime.inSeconds % 60).toString().padLeft(2, '0')}s';
                  return Text(
                    formattedTime,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: FontSize.s16,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: AppMargin.m8),
          Expanded(
            child: DefaultTabController(
              length: 2, // Number of tabs
              child: TabBar(
                controller: widget.tabController,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: AppPadding.p4,
                    color: Palette.white,
                  ),
                  insets: EdgeInsets.symmetric(
                      horizontal: 2), // Desired insets for the indicator
                ),
                labelStyle: const TextStyle(
                  fontSize: FontSize.s16,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: FontSize.s16,
                  fontWeight: FontWeight.normal,
                ),
                tabs: const [
                  Tab(
                    child: Text(
                      StringManager.tab1Title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:FontSize.s16,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      StringManager.tab2Title,
                      style: TextStyle(
                        color: Palette.white,
                        fontSize: FontSize.s16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: AppSize.s28,
              color: Palette.white,
            ),
          ),
        ],
      ),
    );
  }
}
