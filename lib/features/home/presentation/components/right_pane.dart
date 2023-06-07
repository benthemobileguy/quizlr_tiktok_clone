import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizlr_tiktok_clone/core/constants/palette.dart';

class RightPanel extends StatelessWidget {
  const RightPanel({
    Key? key,
    required this.size,
    required this.profileImg,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.flipImg
  }) : super(key: key);

  final Size size;
  final String profileImg;
  final String likes;
  final String comments;
  final String shares;
  final String flipImg;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: size.height,
        child: Column(
          children: [
            Container(
              height: size.height * 0.15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getProfile(
                    profileImg: profileImg,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  getIcon(
                    icon: "heart",
                    count: comments,
                    size: 28,
                  ),
                  getIcon(
                    icon: "comments",
                    count: shares,
                    size: 28,
                  ),
                  getIcon(
                    icon: "union",
                    count: shares,
                    size: 28,
                  ),
                  getIcon(
                    icon: "bookmark",
                    count: shares,
                    size: 28,
                  ),
                   getFlipButton(
                    flipImg: flipImg,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  getIcon({icon, double? size, count}) {
    return Column(
      children: [
        const SizedBox(height: 10),
        SvgPicture.asset(
        'assets/images/$icon.svg', // Replace with your SVG asset path
        height: size,
        width: size,
      ),
        const SizedBox(height: 5),
        Text(
          count,
          style:
              const TextStyle(
                fontWeight: FontWeight.w500, 
              fontSize: 12, 
              color: Colors.white),
        ),
         const SizedBox(height: 10),
      ],
    );
  }

 Widget getProfile({String? profileImg}) {
  return profileImg!.isNotEmpty ? IconButton(
    iconSize: 50,
    icon: Image.network(
      profileImg,
    ),
    onPressed: () {},
  ): Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      color: Palette.background1,
      borderRadius: BorderRadius.circular(50),
    ),
  );
}
    Widget getFlipButton({flipImg}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          iconSize: 38,
          icon: Image.asset(
            flipImg
          ),
          onPressed: () {

          },
        ),
        const Text(
          'Flip',
          style:
              TextStyle(
                fontWeight: FontWeight.w500, 
              fontSize: 12, 
              color: Colors.white),
        ),
      ],
    );
  }
}
