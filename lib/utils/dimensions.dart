import 'package:flutter/material.dart';

const double designHeight = 812;
const double designWidth = 375;

double getHeight(BuildContext context,double height){
  double screenHeight = MediaQuery.of(context).size.height;
  double newHeight = height/designHeight;
  return screenHeight * newHeight;
}


double getWidth(BuildContext context,double width){
  double screenWidth = MediaQuery.of(context).size.width;
  double newWidth = width/designWidth;
  return screenWidth * newWidth;
}