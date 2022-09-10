import 'package:flutter/material.dart';
import 'package:gobble/utils/dimensions.dart';
import 'package:gobble/widgets/product_detail_widget/variation_widget.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(5), bottomRight:Radius.circular(5)),
              child: Container(
              height: getHeight(context, 322.44),
              width: double.infinity,
              child: Image.network('', fit: BoxFit.cover,),
            ),
          ),
          SizedBox(height: getHeight(context, 30.67)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:getWidth(context,25)),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  const Text('data', style: TextStyle(fontFamily: 'Gilroy',fontWeight: FontWeight.w600,fontSize:18)),
                  const Icon(Icons.favorite_border_outlined)
                ],),
                SizedBox(height: getHeight(context, 30.14)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    VariationWidget(increment: (){}, decrement: (){}),
                    const Text('200',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, fontFamily:'Gilroy'))
                  ],
                ),
                
              ]
            )
            ,)
        ]));
  }
}
