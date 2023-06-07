import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quizlr_tiktok_clone/core/constants/palette.dart';

class ToastUtils {
  static void showToast({
    required String message,
    ToastDuration duration = ToastDuration.short,
    ToastGravity gravity = ToastGravity.center,
    Color backgroundColor = Palette.orange,
    Color textColor = Colors.white,
    double fontSize = 16.0,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: duration == ToastDuration.short ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }
}

enum ToastDuration {
  short,
  long,
}

enum ToastGravity {
  top,
  center,
  bottom,
}
