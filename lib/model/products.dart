// import 'package:flutter/material.dart';


import 'package:gobble/model/product.dart';

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
    print(_);
    print('has gotten the products already');
    
    return Products(
      status : data['status'],
      data: _
    );
  }
}