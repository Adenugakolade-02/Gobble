import 'package:flutter/material.dart';
import 'package:gobble/model/parser.dart';
import 'package:gobble/model/reviews.dart';
import 'package:gobble/widgets/product_detail_with_reviews_widget/reviews_card.dart';

import '../utils/dimensions.dart';
import '../widgets/product_detail_with_reviews_widget/details_with_review_widget.dart';

class ReviewScreen extends StatelessWidget {
  final String id;

  const ReviewScreen({Key? key, required this.id}) : super(key: key);

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
              SizedBox(height: getHeight(context, 10)),
              FutureBuilder(
                future: ParseProducts().getReviews(id),
                builder: ((context, snapshot){
                  if(!snapshot.hasData){
                    return const Center(child: CircularProgressIndicator());      
                  }
                  else{
                    List<Reviews> reviews = snapshot.data as List<Reviews>;
                    return Expanded(
                  child: ListView.builder(
                    itemCount: reviews.length,
                    itemBuilder: (BuildContext context, int index){
                      return ReviewsCard(text: reviews[index].review, user: reviews[index].user,);
                    }),
                );
                  }
                }),  

              ),
            ],
          ),
        ),
      ),
    );
  }
}
