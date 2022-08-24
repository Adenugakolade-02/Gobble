import 'package:flutter/material.dart';
import 'package:gobble/utils/dimensions.dart';

class BuildPage extends StatelessWidget {
  final String imageLoc;
  final String mainText;
  final String subText1;
  final String subText2;
  final Function() function;

  BuildPage({
    required this.imageLoc,
    required this.mainText,
    required this.subText1,
    required this.subText2,
    required this.function
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: getHeight(context, 780),
        // color: Colors.white,
        child: Column(
          children: [
            Stack(children: [
              Container(
                  height: getHeight(context, 538),
                  color: Color(0xFFE4F3EA),
                  child: Image.asset(
                    imageLoc,
                    fit: BoxFit.scaleDown,
                  )),
              Positioned(
                  top: 30,
                  right: 15,
                  child: TextButton(
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                          color: Colors.black38,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    onPressed: function,
                  ))
            ]),
            SizedBox(height: getHeight(context, 30)),
            Text(mainText,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 25)),
            SizedBox(height: getHeight(context, 30)),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: FittedBox(
                    child: Text(
                  subText1,
                  style: const TextStyle(
                      fontSize: 5,
                      fontWeight: FontWeight.w400,
                      color: Colors.black38),
                ))),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                child: FittedBox(
                    child: Text(
                  subText2,
                  style: const TextStyle(
                      fontSize: 3,
                      fontWeight: FontWeight.w400,
                      color: Colors.black38),
                  textAlign: TextAlign.center,
                )))
          ],
        ),
      ),
    );
  }
}
