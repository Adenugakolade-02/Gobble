import 'package:flutter/material.dart';
import 'package:gobble/model/cart.dart';
import 'package:provider/provider.dart';

import '../../model/product.dart';
import '../../model/products_provider.dart';
import '../../utils/dimensions.dart';

class VariationWidget extends StatelessWidget {
  final String id;

  VariationWidget({Key? key, required this.id}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    Product product = context.read<ProductsProvider>().obtainProduct(id);
    int quantity = context.select<Cart, int>((provider) => provider.obtainCartItemTotalQuantity(id));
    
    return Container(
      width: getWidth(context, 140.67),
      height: getHeight(context, 45.67),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          
          IconButton(
            onPressed: () => quantity !=0 ? context.read<Cart>().decreaseProduct(id): {},
            icon: const Icon(Icons.remove, color: Colors.grey,)),
          
          Container(
            width: getWidth(context, 45.67),
            height: getHeight(context, 45.67),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.black12)
            ),
            child: Center(child: Text('$quantity'))),
          
          IconButton(
            onPressed: ()=> context.read<Cart>().add(product),
            icon: const Icon(Icons.add_outlined, color: Color(0xFF53B175),)),
        ],
      ),
    );
  }
}