import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';

class ReviewsCard extends StatelessWidget{
  final String text;
  final String user;

  const ReviewsCard({Key? key, required this.text, required this.user}) : super(key: key);
  
  @override
  Widget build(BuildContext context){
    return Container(
      height: getHeight(context, 120),
      margin: EdgeInsets.symmetric(vertical: getHeight(context, 5)),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(context, 8), vertical: getHeight(context, 8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(children: [
                Icon(Icons.person_rounded),
                SizedBox(width: getWidth(context, 30)),
                Text(user, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily:'Gilroy'))
              ],),
              SizedBox(height: getHeight(context, 20)),
              Text(text, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, fontFamily:'Gilroy', color: Color(0xFF7C7C7C)))
            ]
          ),
        ),
      ),
    );
  }
}