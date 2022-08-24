import 'package:flutter/material.dart';
import 'package:gobble/utils/dimensions.dart';


class OnBoardingButton extends StatelessWidget {
  final String buttonText;
  const OnBoardingButton(this.buttonText);
  
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF54B175),
        minimumSize: Size(double.infinity,getHeight(context, 56)),
        // shape:
      ),
      onPressed: (){},
      child: Text(buttonText),
    );
  }
}