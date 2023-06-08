import 'package:flutter/material.dart';
import 'package:quizlr_tiktok_clone/core/constants/palette.dart';
import 'package:quizlr_tiktok_clone/core/resources/font_manager.dart';
import 'package:quizlr_tiktok_clone/core/resources/string_manager.dart';
import 'package:quizlr_tiktok_clone/core/resources/values_manager.dart';
import 'package:quizlr_tiktok_clone/features/home/domain/entities/following.dart';

class FlashQuestionDetails extends StatelessWidget {
  final Following following;
  const FlashQuestionDetails({
    super.key, required this.following,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              following.flashcardFront!,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontWeight: FontWeightManager.regular,
                fontSize: FontSize.s18,
                height: 1.2,
                color: Palette.white,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical:AppMargin.m20),
            width: 286,
            height: 0,
            child: const DecoratedBox(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: Color.fromRGBO(255, 255, 255, 0.2),
                  ),
                ),
              ),
            ),
          ),
          const Text(
            StringManager.answer,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: FontSize.s13,
              height: 1.4,
              color: Palette.green,
            ),
          ),
          const SizedBox(height: AppMargin.m3),
          Text(
            following.flashcardBack!,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeightManager.regular,
              fontSize: FontSize.s18,
              height: 25.06 / 21,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: AppMargin.m30),
          Text(
            StringManager.quesEnquiry,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: FontSize.s13,
              height: 1.4,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildButton('1', Palette.orange),
              buildButton('2', Palette.lightOrange),
              buildButton('3', Palette.yellow),
              buildButton('4', Palette.darkGreen),
              buildButton('5', Palette.teal),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButton(String text, Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: FontSize.s17,
            height: 20 / 17,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
