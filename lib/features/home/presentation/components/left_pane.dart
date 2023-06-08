import 'package:flutter/material.dart';
import 'package:quizlr_tiktok_clone/core/constants/palette.dart';
import 'package:quizlr_tiktok_clone/core/resources/font_manager.dart';
import 'package:quizlr_tiktok_clone/core/resources/values_manager.dart';

class LeftPanel extends StatelessWidget {
  const LeftPanel({
    Key? key,
    required this.size,
    required this.name,
    required this.content,
  }) : super(key: key);

  final Size size;
  final String name;
  final String content;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      width: size.width * 0.78,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            name,
            style: const TextStyle(
                color: Palette.white, fontSize: FontSize.s16, fontWeight: FontWeightManager.regular),
          ),
          const SizedBox(height: AppPadding.p4),
          Text(
            content,
            style: const TextStyle(
              fontWeight: FontWeightManager.regular,
              color: Colors.white,
              fontSize: FontSize.s14,
            ),
          ),
          const SizedBox(height: AppMargin.m25,)
        ],
      ),
    );
  }
}
