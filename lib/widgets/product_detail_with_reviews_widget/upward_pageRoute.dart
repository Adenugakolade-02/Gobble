import 'package:flutter/material.dart';

class UpwardPageRoute extends PageRouteBuilder{
  final Widget widget;
  UpwardPageRoute({required this.widget}) 
  : super(
    transitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation, Widget widget){
      animation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0,1),
          end: Offset.zero,
          ).animate(animation),
        child: widget
      );
    },
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secAnimation){
      return widget;
    }
  );
  
}