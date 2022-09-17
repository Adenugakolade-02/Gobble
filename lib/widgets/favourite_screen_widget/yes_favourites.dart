import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gobble/model/products_provider.dart';
import 'package:gobble/widgets/favourite_screen_widget/favourite_widget.dart';
import 'package:gobble/widgets/onboarding_widgets/onboarding_buttons.dart';
import 'package:provider/provider.dart';

import '../../model/product.dart';
import '../../utils/dimensions.dart';

class YesFavourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle _style1 = const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF181725));
    
      return Container(
        height: getHeight(context, 655),
        child: Column(
          children: [
            Expanded(
              child: Consumer<ProductsProvider>(builder: (context, value, child){
                return ListView.builder(
                  itemCount: value.getFavourite().length,
                  itemBuilder: (_, index){
                    UnmodifiableListView<Product> fav = value.getFavourite();
                    return FavouriteWidget(price: '${fav[index].price}', name: fav[index].name, imageUrl: fav[index].image, id: fav[index].id);
                  });
              }),
            ),
            // SizedBox(height:getHeight(context,20)),
            OnBoardingButton('Add All To Cart', (){}),

            // SizedBox(height:getHeight(context,10))

          ],
        ),
      );
  }
}