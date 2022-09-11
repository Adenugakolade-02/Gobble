import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
import '../widgets/product_detail_widget/details_with_review_widget.dart';

class Reviews extends StatefulWidget {
  // bool isDetails;
  // bool isReviews;

  // Reviews(this.isDetails, this.isReviews);

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  
  Widget build(BuildContext context) {
    // final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    // bool isDetails = arguments['isDetails'];
    // bool isReviews = arguments['isReviews'];
    // Function() detailsFunction = arguments['detailsFunction'];
    // Function() reviewsFunction = arguments['reviewsFunction'];

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal:getWidth(context,25)),
        child: Column(children: <Widget>[
          SizedBox(height:getHeight(context, 50)),
          DetailsWithReview(isDetails: false, isReviews: true, detailsFunction: (){Navigator.of(context).pop();
          // setState(() {
          //   widget.isDetails=!widget.isDetails; widget.isReviews=!widget.isReviews;
          // }); 
          }, reviewsFunction: (){})
        ]
        ),
      ),
    );
  }
}