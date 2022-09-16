import 'package:flutter/material.dart';
import 'package:gobble/utils/dimensions.dart';

import '../onboarding_widgets/onboarding_buttons.dart';

class NoFavourites extends StatelessWidget {
  final TextStyle _style = const TextStyle(fontSize: 19, fontWeight: FontWeight.w400, color: Colors.black38);
  final TextStyle _style1 = const TextStyle(fontSize: 23, fontWeight: FontWeight.w600, color: Color(0xFF181725));
  @override
  
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Container(
            height: getHeight(context, 400),
            color: const Color(0xFFFBFBFB),
            width: double.infinity,
            child: Image.asset(
              'assets/images/Empty Favourite.png',
              fit: BoxFit.scaleDown,
            ),
          ),

          SizedBox(height: getHeight(context, 30)),

          Text('Oops your wishlist is empty!', style: _style1,),

          SizedBox(height: getHeight(context, 20)),
          
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: FittedBox(
                  child: Text('It seems nothing in here, Explore more',
                      style: _style))),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              child: Text(
                'and shortlist some item.',
                style: _style,
                textAlign: TextAlign.center,
              )),
              
          SizedBox(height: getHeight(context, 30)),
            
          OnBoardingButton('Start Shopping', (){}),

        ],
      
    );
  }
}
