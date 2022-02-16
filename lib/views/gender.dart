import 'package:bmi_calculator/config/size.dart';
import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/views/homepage.dart';
import 'package:flutter/material.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({Key? key}) : super(key: key);

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().set(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF009ffd),
            Color(0xFF2a2a72),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Card(
            elevation: 4,
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: userScreenPadding, vertical: userScreenPadding / 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(
                color: Colors.grey.withOpacity(0.4),
                width: 1,
              ),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(userScreenPadding, userScreenPadding, userScreenPadding, userScreenPadding / 2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 4.0,
                          margin: EdgeInsets.fromLTRB(userScreenPadding, userScreenPadding / 2, userScreenPadding / 3, userScreenPadding),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20.0),
                            onTap: () {
                              setState(() {
                                isMale = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: (isMale) ? Border.all(width: 2.0, color: Colors.blue) : Border.all(width: 0.0, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              height: userScreenWidth * 0.4,
                              child: const Image(
                                image: AssetImage('assets/male.png'),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          elevation: 4.0,
                          margin: EdgeInsets.fromLTRB(userScreenPadding / 3, userScreenPadding / 2, userScreenPadding, userScreenPadding),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20.0),
                            onTap: () {
                              setState(() {
                                isMale = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: (!isMale) ? Border.all(width: 2.0, color: Colors.blue) : Border.all(width: 0.0, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              height: userScreenWidth * 0.4,
                              child: const Image(
                                image: AssetImage('assets/female.png'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    (isMale) ? 'Male' : 'Female',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: userScreenPadding * 3, vertical: userScreenPadding / 2),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: EdgeInsets.zero,
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Homepage()));
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: userScreenPadding, vertical: userScreenPadding / 1.5),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Select',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
