import 'package:flutter/material.dart';
import 'package:gobble/model/products_provider.dart';
import 'package:gobble/model/reviews.dart';
import 'package:gobble/model/parser.dart';
import 'package:gobble/screens/reviews_screen.dart';
import 'package:gobble/utils/dimensions.dart';
import 'package:gobble/widgets/onboarding_widgets/onboarding_buttons.dart';
import 'package:gobble/widgets/product_detail_with_reviews_widget/details_with_review_widget.dart';
import 'package:gobble/widgets/product_detail_with_reviews_widget/variation_widget.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';
import '../widgets/product_detail_with_reviews_widget/upward_pageRoute.dart';

class ProductDetails extends StatefulWidget {

  final String id;

  const ProductDetails({Key? key, required this.id,}) : super(key: key);
  
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  
  bool isDetails = true;
  bool isReviews = false;
  // bool isFavourite = false;
  
  void detailsFunction()=> setState(() {isDetails = true;isReviews = false;});

  void reviewsFunction()=> setState(() {
    isReviews = false;
    isDetails = true;
    Navigator.push(context, UpwardPageRoute(widget: ReviewScreen(id: widget.id,)));
    });

  @override
  Widget build(BuildContext context) {
    Product product = context.read<ProductsProvider>().obtainProduct(widget.id);
    
    return Scaffold(
      body: SafeArea(
              child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(20), bottomRight:Radius.circular(20)),
                child: Container(
                height: getHeight(context, 322.44),
                width: double.infinity,
                child: Image.network(product.image, fit: BoxFit.cover,),
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
                    
                    Text(product.name, style: const TextStyle(fontFamily: 'Gilroy',fontWeight: FontWeight.w600,fontSize:18)),
                    
                    IconButton(
                      onPressed: ()=> setState(() {
                        context.read<ProductsProvider>().toggleFavouite(widget.id);
                      }),
                      
                      icon: product.isFavourite ? const Icon(Icons.favorite_rounded, color: Color(0xFF53B175)) : const Icon(Icons.favorite_border_outlined,) )
                  ],),
                  
                  SizedBox(height: getHeight(context, 30.14)),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      
                      VariationWidget(id: product.id,),
                      
                      Text('${product.price}',style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, fontFamily:'Gilroy'))
                    ],
                  ),

                  SizedBox(height: getHeight(context, 48.45)),

                  DetailsWithReview(isDetails: isDetails, isReviews: isReviews, detailsFunction: detailsFunction, reviewsFunction: reviewsFunction),
                  
                  Container(
                    margin: EdgeInsets.symmetric(vertical: getHeight(context, 10)),
                    height: getHeight(context, 115),
                    child: Text(product.description, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, fontFamily:'Gilroy', color: Color(0xFF7C7C7C)),)),
                  
                  OnBoardingButton("Buy Now", (){}),
                  
                  SizedBox(height:getHeight(context, 15))
                ]
              )
              ,)
          ]),
      ),
        );
  }
}
