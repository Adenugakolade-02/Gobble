import 'package:flutter/material.dart';
import 'package:gobble/widgets/onboarding_widgets/build_page.dart';
import 'package:gobble/widgets/onboarding_widgets/onboarding_buttons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utils/dimensions.dart';

class OnBoardingScreen extends StatelessWidget {
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: <Widget>[
        BuildPage(
        imageLoc: 'assets/images/Onboarding 1.png', 
        mainText: "Fresh Vegetables", 
        subText1: 'Vegetables that are directly picked by farmers', 
        subText2: 'and guaranteed quality and freshness'),
        BuildPage(
        imageLoc: 'assets/images/Onboarding 2.png', 
        mainText: "Fresh Vegetables", 
        subText1: 'Vegetables that are directly picked by farmers', 
        subText2: 'and guaranteed quality and freshness'),
        BuildPage(
        imageLoc: 'assets/images/Onboarding 3.png', 
        mainText: "Fresh Vegetables", 
        subText1: 'Vegetables that are directly picked by farmers', 
        subText2: 'and guaranteed quality and freshness'),

        ],
      ),
      bottomSheet: Container(
        height: getHeight(context, 132),
        padding: EdgeInsets.symmetric(horizontal: getWidth(context, 4)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: SmoothPageIndicator(
                count: 3,
                effect: const ExpandingDotsEffect(activeDotColor: Color(0xFF54B175), dotWidth: 10, dotHeight: 10),
                controller: controller),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const OnBoardingButton("Get Started"),
              
            ),
          ],
        ),
      ),
    );
  }
}