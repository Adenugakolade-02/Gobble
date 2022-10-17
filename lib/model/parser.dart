import 'package:gobble/model/app_constants.dart';
import 'package:gobble/model/products.dart';
import 'package:gobble/model/reviews.dart';
import 'package:gobble/model/user_preference.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
class ParseProducts{
  final String _productsUrl = AppConstant.productsApi;
  final String _reviewsUrl = AppConstant.reviewsApi;

  
  
  Future<Products> getProducts() async {
    Uri productUri = Uri.parse(_productsUrl);
    final response = await http.get(productUri);
    
    if (response.statusCode!=200){
      throw http.ClientException("Problem with URL provided");
    }
  
    return Products.fromJson(jsonDecode(response.body));
  }

  Future<List<Reviews>>  getReviews(String id) async{
    Uri reviewUri = Uri.parse(_reviewsUrl+id);
    final response = await http.get(reviewUri);

    if (response.statusCode!=200){
      throw http.ClientException("Problem with URL provided");
    }
    else{
      List<dynamic> _ = jsonDecode(response.body)['data'];
      return _.map((elements) => Reviews.fromJson(elements)).toList();
      
    }
  }

  Future<void> postReview(String review, String id) async{
    Uri postUri = Uri.parse(AppConstant.reviewsApi+id);
    String token = await UserPreference().getToken();
    
    Response response = await http.post(
      postUri,
      body: json.encode({'review': review}),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      }
    );

    if(response.statusCode !=200){
      throw http.ClientException("Problem with URL provided");
    }
    
  }
}