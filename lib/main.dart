import 'package:bmi_calculator/config/theme.dart';
import 'package:bmi_calculator/views/gender.dart';
import 'package:flutter/material.dart';

late double userScreenWidth = 0;
late double userScreenHeight;
late double userTextSize = 0.0;
late double userScreenPadding;
bool isMale = true;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: theme(
        context,
      ),
      home: const GenderSelection(),
    );
  }
}
