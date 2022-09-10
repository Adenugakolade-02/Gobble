import 'package:flutter/material.dart';
import 'package:gobble/widgets/home_screen_widgets/display_product.dart';

import '../utils/dimensions.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: getHeight(context, 25)),
      child: SafeArea(
          child: Column(children: <Widget>[
        const Center(
            child: Text('Gobble',
                style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Color(0xFF53B175)))),
      SizedBox(height: getHeight(context,50)),
      Expanded(child: DisPlayWidget()),

      ])),
    ));
  }
}
