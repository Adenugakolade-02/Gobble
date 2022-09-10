import 'package:flutter/material.dart';
import 'package:gobble/model/parse_products.dart';
import 'package:gobble/model/products.dart';
import 'package:gobble/widgets/home_screen_widgets/basic_product.dart';

class DisPlayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ParseProducts().getProducts(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } 
        else {
          Products productData = snapshot.data as Products;
          return GridView.builder(
              itemCount: productData.data.length,
              
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 1
                ),
              itemBuilder: (BuildContext context, int index) {
                return BasicProduct(
                  imageUrl: productData.data[index].image,
                  amount: productData.data[index].price.toString(),
                  name: productData.data[index].name,
                  function: () {},
                  rating: productData.data[index].averageReview,
                );
              });
        }
      },
    );
  }
}
