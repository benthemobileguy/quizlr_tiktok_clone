import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.only(left: 20, right: 60),
        child: Text(
          question,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 21,
            height: 1.2,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
