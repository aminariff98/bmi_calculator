import 'package:flutter/material.dart';

ThemeData theme(BuildContext context) {
  return ThemeData(
    // canvasColor: Theme.of(context).brightness == Brightness.dark || Provider.of<DarkNotifier>(context).isDark ? Colors.black45 : Color(0xffF3F6FB),
    brightness: Brightness.dark,
    canvasColor: const Color(0xffF3F6FB),
    primaryColor: const Color(0xFF86337c),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'Inter',
    primarySwatch: Colors.blue,

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      primary: const Color(0XFFEEF4FD),
      textStyle: const TextStyle(color: Colors.white),
      padding: EdgeInsets.zero,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    )),
    textTheme: TextTheme(
      headline1: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Color(0xff163567)),
      headline2: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        foreground: Paint()
          ..shader = const LinearGradient(
            colors: <Color>[
              Color(0xFF009ffd),
              Color(0xFF2a2a72),
            ],
          ).createShader(const Rect.fromLTWH(0.0, 0.0, 500.0, 70.0)),
      ),
      //body
      bodyText1: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Color(0xff163567)),
      bodyText2: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500, color: Color(0xff163567)),
    ),
  );
}
