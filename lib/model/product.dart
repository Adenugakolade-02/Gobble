import 'dart:convert';

class Product{
  final String id;
  final String name;
  final String description;
  final double price;
  final String image;
  final String category;
  final double averageReview;
  bool isFavourite;

  Product({
    required this.id,
    required this.name, 
    required this.description, 
    required this.price, 
    required this.image, 
    required this.category, 
    required this.averageReview
    }):isFavourite=false;

  factory Product.fromJson(Map<String, dynamic> data){
    return Product(
      id: '${data['id']}',
      name: data['name'] ?? '', 
      description: data['description'] ?? '', 
      price: data['price'].toDouble() ?? 0, 
      image: data['image'] ?? '', 
      category: data['category'] ?? '', 
      averageReview: data['averageReview'].toDouble()  ?? 0
      );
  }

  Map<String, dynamic> toJson() => 
  
  {'name':name,
  'description':description,
  'price':price,
  'image':image,
  'category':category,
  'averageReview':averageReview
  };


}