import 'package:flutter/material.dart';
import 'package:quizlr_tiktok_clone/core/constants/palette.dart';

class FlashQuestionDetails extends StatelessWidget {
  const FlashQuestionDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'What was the name of the Act that created federal subsidies for the construction of a transcontinental railroad?',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18.5,
              height: 1.2,
              color: Colors.white,
            ),
          ),
           Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
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
            'Answer',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 12.5,
              height: 1.4,
              color: Palette.green,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            'With the rapid settlement in western territories, Congress decided that an efficient railroad transport to the Pacific coast would be beneficial and passed the Pacific Railway Act of 1862 during the Civil War to promote easier western transportation for the North.',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18.5,
              height: 25.06 / 21,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'How well did you know this?',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.5,
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
            fontSize: 17,
            height: 20 / 17,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}