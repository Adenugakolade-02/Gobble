import 'package:flutter/material.dart';
import 'package:gobble/screens/product_detail_screen.dart';
import 'package:gobble/utils/dimensions.dart';

class FavouriteWidget extends StatelessWidget {
  final String price,name,imageUrl,id;

  const FavouriteWidget({Key? key, required this.price, required this.name, required this.imageUrl, required this.id}) : super(key: key);
  
  final TextStyle _style = const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF181725));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const Divider(),
        Container(
          height: getHeight(context, 115),
          margin: const EdgeInsets.only(bottom:10,top: 10),
          width: double.infinity,
          // decoration: BoxDecoration(
          //   border: Border.all(color:Colors.grey)
          // ),
          child: Row(
            children: <Widget>[
              Container(
                height: 115,
                width: 115,
                child: Image.network(imageUrl, fit:BoxFit.fill),
                ),

                SizedBox(width: getWidth(context,22.04)),

                SizedBox(width: getWidth(context, 60),child: Wrap(children:[Text(name, style: _style,)])),

                SizedBox(width: getWidth(context,10)),

                Text('N '+price, style: _style,),

                SizedBox(width: getWidth(context,8)),

                IconButton(onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProductDetails(id: id,))),
                 icon: const Icon(Icons.arrow_forward_ios, color: Color(0xFF181725),))
            ]
          ),
        ),
        const Divider()
      ],
    );
  }
}