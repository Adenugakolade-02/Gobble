import 'package:flutter/material.dart';
import 'package:gobble/utils/dimensions.dart';
import 'package:gobble/widgets/product_detail_widget/details_with_review_widget.dart';
import 'package:gobble/widgets/product_detail_widget/variation_widget.dart';

class ProductDetails extends StatefulWidget {
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isDetails = true;

  bool isReviews = false;
  bool isFavourite = false;

  void detailsFunction()=> setState(() {isDetails = !isDetails;isReviews = !isReviews;});

  void reviewsFunction()=> setState(() {isReviews = !isReviews;isDetails = !isDetails;});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(20), bottomRight:Radius.circular(20)),
              child: Container(
              height: getHeight(context, 322.44),
              width: double.infinity,
              color: Colors.black,
              // child: Image.network('', fit: BoxFit.cover,),
            ),
          ),
          SizedBox(height: getHeight(context, 30.67)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:getWidth(context,25)),
            child: Column(
              children: <Widget>[
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  const Text('Data', style: TextStyle(fontFamily: 'Gilroy',fontWeight: FontWeight.w600,fontSize:18)),
                  IconButton(
                    onPressed: (){
                      setState(() {
                        isFavourite = !isFavourite;
                      });
                    },
                    icon: isFavourite ? const Icon(Icons.favorite_rounded, color: Color(0xFF53B175)) : const Icon(Icons.favorite_border_outlined,) )
                ],),
                
                SizedBox(height: getHeight(context, 30.14)),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    VariationWidget(increment: (){}, decrement: (){}),
                    const Text('N 200',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, fontFamily:'Gilroy'))
                  ],
                ),
                SizedBox(height: getHeight(context, 48.45)),

                DetailsWithReview(isDetails: isDetails, isReviews: isReviews, detailsFunction: detailsFunction, reviewsFunction: reviewsFunction)
              ]
            )
            ,)
        ]));
  }
}
