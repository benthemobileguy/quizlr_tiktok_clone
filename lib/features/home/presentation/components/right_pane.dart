import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizlr_tiktok_clone/core/constants/palette.dart';
import 'package:quizlr_tiktok_clone/core/resources/font_manager.dart';
import 'package:quizlr_tiktok_clone/core/resources/string_manager.dart';
import 'package:quizlr_tiktok_clone/core/resources/values_manager.dart';

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
                    height: AppPadding.p10,
                  ),
                  getIcon(
                    icon: StringManager.heart,
                    count: comments,
                    size: AppSize.s28,
                  ),
                  getIcon(
                    icon: StringManager.comments,
                    count: shares,
                    size: AppSize.s28,
                  ),
                  getIcon(
                    icon: StringManager.union,
                    count: shares,
                    size: AppSize.s28,
                  ),
                  getIcon(
                    icon: StringManager.bookmark,
                    count: shares,
                    size: AppSize.s28,
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
        const SizedBox(height: AppMargin.m10),
        SvgPicture.asset(
        'assets/images/$icon.svg', 
        height: size,
        width: size,
      ),
        const SizedBox(height: AppPadding.p4),
        Text(
          count,
          style:
              const TextStyle(
                fontWeight: FontWeightManager.medium, 
              fontSize: FontSize.s12, 
              color: Colors.white),
        ),
         const SizedBox(height: AppPadding.p10),
      ],
    );
  }

 Widget getProfile({String? profileImg}) {
  return profileImg!.isNotEmpty ? IconButton(
    iconSize: AppSize.s50,
    icon: Image.network(
      profileImg,
    ),
    onPressed: () {},
  ): Container(
    height: AppMargin.m50,
    width: AppMargin.m50,
    decoration: BoxDecoration(
      color: Palette.background1,
      borderRadius: BorderRadius.circular(AppSize.s50),
    ),
  );
}
    Widget getFlipButton({flipImg}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          iconSize: AppSize.s40,
          icon: Image.asset(
            flipImg
          ),
          onPressed: () {

          },
        ),
        const Text(
          StringManager.flip,
          style:
              TextStyle(
                fontWeight: FontWeightManager.medium, 
              fontSize: FontSize.s12, 
              color: Palette.white),
        ),
      ],
    );
  }
}
