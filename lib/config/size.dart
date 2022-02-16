import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';

late MediaQueryData _mediaQueryData;

class SizeConfig {
  void set(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    userScreenWidth = _mediaQueryData.size.width;
    userScreenHeight = _mediaQueryData.size.height;
    userScreenPadding = (userScreenWidth * 0.05);
    if (userScreenWidth < 500) {
      userTextSize = 0.0;
    } else {
      userTextSize = 7.0;
    }
  }
}
