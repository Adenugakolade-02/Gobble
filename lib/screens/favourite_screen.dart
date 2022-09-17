import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gobble/widgets/favourite_screen_widget/no_favourites.dart';
import 'package:gobble/widgets/favourite_screen_widget/yes_favourites.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';
import '../model/products_provider.dart';
import '../utils/dimensions.dart';

class FavouriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    bool isEmpty = context.select<ProductsProvider, bool>((provider) => provider.isEmpty);
    const TextStyle _style1 = TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF53B175));
    
    return SafeArea(
          child: Column(
        children: [
          SizedBox(height: getHeight(context,10)),
          const Text('Favourites', style: _style1,),
          SizedBox(height: getHeight(context,15)),
          isEmpty? NoFavourites(): YesFavourites(),
        ],
      ),
    );
  
  }
}