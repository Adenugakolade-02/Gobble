import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';

class BasicProduct extends StatelessWidget {
  final String imageUrl;
  final String amount;
  final String name;
  final Function() function;
  const BasicProduct({required this.imageUrl, required this.amount, required this.name, required this.function});
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(bottom:getHeight(context,25.87), top:),
      margin: EdgeInsets.symmetric(horizontal: getWidth(context,14)),
      height: getHeight(context, 248.51),
      width: getWidth(context, 173.32),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Column(children: <Widget>[
        Center(
          child: Container(
            height: getHeight(context, 93.21),
            width: getWidth(context, 93.21),
            child: Image.asset(imageUrl, fit: BoxFit.scaleDown)
          )
        ),
        SizedBox(height: getHeight(context, 27.54),),
        Text(name,style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily:'Gilroy')),
        SizedBox(height: getHeight(context, 56.69)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Text('\$${amount}'),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF54B175),
              minimumSize: Size(getHeight(context, 45.67),getHeight(context, 45.67)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
            ),
            onPressed: function, child: const Icon(Icons.add))
        ],)
      ]),
    );
  }
}