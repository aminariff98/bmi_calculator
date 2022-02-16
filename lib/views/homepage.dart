// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String userHeight = '', userWeight = '', userAge = '';
  String userHeightError = '', userWeightError = '', userAgeError = '';
  TextEditingController? _ageController, _heightController, _weightController;
  late double bmiPercentage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          child: Text(
            'BMI Calculator',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2!.apply(
                  fontSizeDelta: userTextSize,
                  fontWeightDelta: -1,
                ),
          ),
        ),
        foregroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(userScreenPadding, 0, userScreenPadding, userScreenPadding),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: userScreenWidth * 0.7,
                child: Image(
                  image: AssetImage(isMale ? 'assets/male.png' : 'assets/female.png'),
                ),
              ),
              SizedBox(height: userScreenPadding / 2),
              fieldTitle('Age'),
              _textInputForm('userAge', true, false, _ageController, '2 - 120', userAgeError, 'number', 3, 1, ''),
              fieldTitle('Height'),
              _textInputForm('userHeight', true, false, _heightController, '', userHeightError, 'number', 3, 1, 'cm'),
              fieldTitle('Weight'),
              _textInputForm('userWeight', true, false, _weightController, '', userWeightError, 'number', 3, 1, 'kg'),
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: userScreenPadding * 3, vertical: userScreenPadding * 2),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: EdgeInsets.zero,
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: () {
                        onButtonPressed();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: userScreenPadding * 3, vertical: userScreenPadding / 1.5),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Calculate',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: userScreenPadding,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _ageController = TextEditingController(text: '');
                          _heightController = TextEditingController(text: '');
                          _weightController = TextEditingController(text: '');
                          userAgeError = '';
                          userHeightError = '';
                          userWeightError = '';
                        });
                      },
                      child: Icon(
                        Icons.refresh,
                        size: 27,
                        color: Color(0xff163567),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onButtonPressed() {
    if (userAge.isNotEmpty && userHeight.isNotEmpty && userWeight.isNotEmpty) {
      calculateBmi();
    } else {
      setState(() {
        if (userAge.isEmpty) {
          userAgeError = 'Age is required';
        }
        if (userHeight.isEmpty) {
          userHeightError = 'Height is required';
        }
        if (userWeight.isEmpty) {
          userWeightError = 'Weight is required';
        }
      });
    }
  }

  Widget fieldTitle(text) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10.0),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText1!.apply(
                  fontSizeDelta: userTextSize,
                ),
          ),
        ),
      ],
    );
  }

  Widget _textInputForm(
      String attribute, bool isEditable, bool isDropDown, TextEditingController? controller, String hintText, String error, String type, int lengthLimit, int linesNumber, String suffixUnit) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                readOnly: !isEditable,
                style: Theme.of(context).textTheme.subtitle2!.apply(color: Color(0xff1C3664), fontSizeDelta: userTextSize),
                cursorColor: Color(0xFF9b9b9b),
                keyboardType: (type == 'number') ? TextInputType.number : TextInputType.text,
                // onTap: () {
                //   if (isDropDown) {
                //     setAction(attribute, context);
                //   }
                // },
                decoration: InputDecoration(
                  fillColor: isDropDown
                      ? const Color(0xFFEAF2FA)
                      : isEditable
                          ? const Color(0xFFdce8f2)
                          : const Color(0xFFF5F6F7),
                  filled: true,
                  suffixIcon: (isDropDown)
                      ? const Icon(
                          Icons.arrow_drop_down,
                          color: Color(0xff1C3664),
                        )
                      : Container(alignment: Alignment.centerRight, width: userScreenWidth * 0.2, padding: EdgeInsets.symmetric(horizontal: userScreenPadding), child: Text(suffixUnit)),
                  contentPadding: EdgeInsets.fromLTRB(userScreenPadding, userScreenPadding / 2, userScreenPadding / 3, userScreenPadding / 2),
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: (error == '') ? BorderSide(color: Colors.transparent, width: 0.0) : BorderSide(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: (error == '') ? BorderSide(color: Colors.transparent, width: 0.0) : BorderSide(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: hintText,
                  hintStyle: Theme.of(context).textTheme.bodyText2!.apply(color: Color(0xFF9D9E9E), fontSizeDelta: userTextSize),
                ),
                controller: controller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  setValues(attribute, value);
                },
                inputFormatters: [
                  if (type == 'number') FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(lengthLimit),
                ],
                minLines: linesNumber,
                maxLines: linesNumber,
              ),
            ),
          ],
        ),
        (error != '')
            ? Row(children: [
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      error,
                      style: Theme.of(context).textTheme.bodyText2!.apply(color: Colors.red, fontSizeDelta: userTextSize),
                    ),
                  ),
                )
              ])
            : Container(),
      ],
    );
  }

  void setValues(attribute, value) {
    switch (attribute) {
      case 'userAge':
        setState(() {
          userAge = (value.isEmpty) ? '' : value;
          userAgeError = '';
        });
        break;
      case 'userHeight':
        setState(() {
          userHeight = (value.isEmpty) ? '' : value;
          userHeightError = '';
        });
        break;
      case 'userWeight':
        setState(() {
          userWeight = (value.isEmpty) ? '' : value;
          userWeightError = '';
        });
        break;
    }
  }

  void calculateBmi() {
    double height = double.parse(userHeight);
    double weight = double.parse(userWeight);
    double age = double.parse(userAge);

    if (age < 2 || age > 150) {
      setState(() {
        userAgeError = 'Please enter a valid age.';
      });
    }

    if (height > 0 && height < 250) {
      if (weight > 0 && weight < 200) {
        //convert unit cm to m

        checkBmiStatus(age, height, weight);
      } else {
        setState(() {
          userWeightError = 'Please enter a valid weight.';
        });
      }
    } else {
      setState(() {
        userHeightError = 'Please enter a valid height.';
      });
    }
  }

  void checkBmiStatus(age, height, weight) {
    height = height / 100;
    bmiPercentage = weight / (height * height);
    late String category;
    late String imagePath = isMale ? 'assets/male-shock.png' : 'assets/female-shock.png';
    dynamic colorCategory;

    if (age <= 18) {
      if (bmiPercentage < 5) {
        category = 'Underweight';
        colorCategory = Colors.yellow[800];
      } else if (bmiPercentage >= 5 && bmiPercentage <= 85) {
        category = 'Healthy weight';
        colorCategory = Colors.green[800];
        imagePath = isMale ? 'assets/male-nice.jpeg' : 'assets/male-nice.jpeg';
      } else if (bmiPercentage >= 85 && bmiPercentage <= 95) {
        category = 'At risk of overweight';
        colorCategory = Colors.yellow[700];
      } else {
        category = 'Overweight';
        colorCategory = Colors.red[900];
      }
    } else {
      if (bmiPercentage < 16) {
        category = 'Severe Thinness';
        colorCategory = Colors.red[900];
      } else if (bmiPercentage >= 16 && bmiPercentage <= 17) {
        category = 'Moderate Thinness';
        colorCategory = Colors.red[300];
      } else if (bmiPercentage >= 17 && bmiPercentage <= 18.5) {
        category = 'Mild Thinness';
        colorCategory = Colors.yellow[700];
      } else if (bmiPercentage >= 18.5 && bmiPercentage <= 25) {
        category = 'Normal';
        colorCategory = Colors.green[800];
        imagePath = isMale ? 'assets/male-nice.jpeg' : 'assets/male-nice.jpeg';
      } else if (bmiPercentage >= 25 && bmiPercentage <= 30) {
        category = 'Overweight';
        colorCategory = Colors.yellow[700];
      } else if (bmiPercentage >= 30 && bmiPercentage <= 35) {
        category = 'Obese Class I';
        colorCategory = Colors.red[300];
      } else if (bmiPercentage >= 35 && bmiPercentage <= 40) {
        category = 'Obese Class II';
        colorCategory = Colors.red[800];
      } else {
        category = 'Obese Class III';
        colorCategory = Colors.red[900];
      }
    }

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: userScreenPadding * 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(31),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: userScreenPadding),
                      height: userScreenWidth * 0.55,
                      child: Image(
                        image: AssetImage(imagePath),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: userScreenPadding, vertical: userScreenPadding / 2),
                      margin: EdgeInsets.symmetric(vertical: userScreenPadding),
                      decoration: BoxDecoration(
                        color: colorCategory,
                        borderRadius: BorderRadius.all(
                          const Radius.circular(15.0),
                        ),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
