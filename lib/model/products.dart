// import 'package:flutter/material.dart';


import 'package:gobble/model/product.dart';
import 'package:gobble/model/reviews.dart';

class Products{
  final String status;
  final List<Product> data;

  Products({
    required this.status, 
    required this.data,
  });

  factory Products.fromJson(Map <String, dynamic> data){
    List<dynamic> productList = data['data'];
    List<Product> _ = productList.map((e) => Product.fromJson(e)).toList();
    
    return Products(
      status : data['status'],
      data: _
    );
  }
}