import 'package:flutter/material.dart';
import 'package:quizlr_tiktok_clone/core/constants/palette.dart';
import 'package:quizlr_tiktok_clone/core/resources/font_manager.dart';
import 'package:quizlr_tiktok_clone/core/resources/values_manager.dart';

class FlashQuestion extends StatelessWidget {
  final String question;
  const FlashQuestion({
    super.key, 
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: AppPadding.p20,
        right: AppPadding.p60),
        child: Text(
          question,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: FontSize.s20,
            height: 1.2,
            color: Palette.white,
          ),
        ),
      ),
    );
  }
}
