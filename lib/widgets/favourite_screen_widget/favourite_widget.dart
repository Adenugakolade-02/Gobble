import 'package:flutter/material.dart';
import 'package:gobble/model/cart.dart';
import 'package:gobble/model/product.dart';
import 'package:gobble/model/products_provider.dart';
import 'package:gobble/utils/dimensions.dart';
import 'package:gobble/widgets/onboarding_widgets/onboarding_buttons.dart';
import 'package:provider/provider.dart';

class FavouriteWidget extends StatelessWidget {
  final String price,name,imageUrl,id;

  const FavouriteWidget({Key? key, required this.price, required this.name, required this.imageUrl, required this.id}) : super(key: key);
  final TextStyle _style = const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF181725));
  
  @override
  Widget build(BuildContext context) {
    Product product = context.read<ProductsProvider>().obtainProduct(id);
    return Container(
      height: getHeight(context, 220),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            height: getHeight(context, 140),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  child: Container(
                    height: 115,
                    width: 115,
                    child: Image.network(imageUrl, fit:BoxFit.fill),
                    decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                SizedBox(width:getWidth(context, 10)),
                
                SizedBox(width: getWidth(context, 60),child: Wrap(children:[Text(name, style: _style,)])),
                
                SizedBox(width:getWidth(context, 70)),

                Text('N '+price, style: _style,),
              ]
            )
          ),
          SizedBox(height: getHeight(context, 20)),
          Container(
            color: const Color(0xFFFBFBFB),
            height: getHeight(context, 60),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(child: RemoveButton('Remove', ()=>context.read<ProductsProvider>().toggleFavouite(id))),
                SizedBox(width:getWidth(context, 10)),
                Expanded(child: OnBoardingButton('Add to Cart', ()=>context.read<Cart>().add(product)))
              ]
            ),
          )
        ]
      ),
    );
  }
}

class RemoveButton extends StatelessWidget {
  final Function() function;
  final String buttonText;
  const RemoveButton(this.buttonText, this.function);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFFFBFBFB),
        minimumSize: Size(double.infinity,getHeight(context, 56)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: const BorderSide(color: Color(0xFF54B175))
      ),
      onPressed: function,
      child: Text(buttonText, style: const TextStyle(color: Color(0xFF54B175), fontWeight: FontWeight.w500),),
    );
  }
}
