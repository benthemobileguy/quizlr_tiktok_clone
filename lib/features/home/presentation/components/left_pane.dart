import 'package:flutter/material.dart';

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
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 25,)
        ],
      ),
    );
  }
}
