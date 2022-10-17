import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gobble/model/parser.dart';
import 'package:gobble/model/products.dart';
import 'package:gobble/model/products_provider.dart';
import 'package:gobble/widgets/home_screen_widgets/basic_product.dart';
import 'package:provider/provider.dart';

import '../../model/product.dart';
import '../../screens/product_detail_screen.dart';
import '../../utils/dimensions.dart';
import '../forms/search_form_field.dart';

class DisPlayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool load = context.select<ProductsProvider, bool>((provider) => provider.loaded);
    final productData = context.select<ProductsProvider, UnmodifiableListView<Product>>((provider) => provider.getProducts());

    return SafeArea(
          child: Column(
        children: [
          SizedBox(height: getHeight(context,10)),
          const Center(
            child: Text('Gobble',
              style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color(0xFF53B175)))),
          SizedBox(height: getHeight(context,10)),
          SearchField(),
          SizedBox(height: getHeight(context,30)),
          !load
          ? const Center(child: CircularProgressIndicator())
          : Expanded(
              child: GridView.builder(
                  itemCount: productData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 1),
                  itemBuilder: (BuildContext context, int index) {
                    return BasicProduct(
                      imageUrl: productData[index].image,
                      amount: productData[index].price.toString(),
                      name: productData[index].name,
                      rating: productData[index].averageReview,
                      id: productData[index].id,
                      description: productData[index].description,
                    );
                  }),
            ),
        ],
      ),
    );
  }
}
