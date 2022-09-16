import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gobble/model/product.dart';

import '../../screens/product_detail_screen.dart';
import '../../utils/dimensions.dart';

class BasicProduct extends StatelessWidget {
  final String imageUrl;
  final String amount;
  final String name;
  final double rating;
  final String id;
  final String description;

  const BasicProduct(
      {required this.imageUrl,
      required this.amount,
      required this.name,
      required this.rating,
      required this.id,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetails(
                    id: id,
                  ))),
      child: Container(
        padding: const EdgeInsets.only(bottom: 5),
        height: getHeight(context, 248.51),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Colors.black12)),
        child: Column(children: <Widget>[
          
          Container(
              height: getHeight(context, 200),
              width: double.infinity,
              child: Image.network(imageUrl, fit: BoxFit.fill)),
          
          SizedBox(
            height: getHeight(context, 20.54),
          ),
          
          Text(name,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Gilroy')),
          
          RatingBar.builder(
            initialRating: rating,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemSize: 30,
            ignoreGestures: true,
            onRatingUpdate: (_) {},
          ),
          
          SizedBox(height: getHeight(context, 10)),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              
              Text('N ${amount}',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Gilroy')),
              
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF54B175),
                      fixedSize:
                          Size(getHeight(context, 30), getHeight(context, 30)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {},
                  child: const Icon(Icons.add))
            ],
          )
        ]),
      ),
    );
  }
}
