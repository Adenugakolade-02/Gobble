import 'package:flutter/material.dart';
import 'package:gobble/widgets/product_detail_with_reviews_widget/reviews_card.dart';

import '../utils/dimensions.dart';
import '../widgets/product_detail_with_reviews_widget/details_with_review_widget.dart';

class Reviews extends StatelessWidget {
  // bool isDetails;
  // bool isReviews;

  // Reviews(this.isDetails, this.isReviews);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(context, 15)),
          child: Column(
            children: [
              SizedBox(height: getHeight(context, 10)),
              DetailsWithReview(
                  isDetails: false,
                  isReviews: true,
                  detailsFunction: () {
                    Navigator.of(context).pop();
                  },
                  reviewsFunction: () {}),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    SizedBox(height: getHeight(context, 10)),
                    Column(children: [
                      ReviewsCard(
                          text:
                              "Apples are nutritious. Apples may be good for weight loss."),
                      ReviewsCard(text: "apples may be good for your heart."),
                      ReviewsCard(text: "apples may be good for your heart."),
                       ReviewsCard(text: "apples may be good for your heart."),
                    ])
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
