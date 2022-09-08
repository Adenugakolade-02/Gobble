import 'package:gobble/model/products.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class ParseProducts{
  final String _url = 'https://gobble-foods.herokuapp.com/api/v1/products';
  // Uri producUri = Uri.parse(url);

  
  
  Future<Products> getProducts() async {
    Uri productUri = Uri.parse(_url);
    final response = await http.get(productUri);
    // print('gotten here in fetching');
    
    if (response.statusCode!=200){
      throw http.ClientException("Problem with URL provided");
    }
    print(response.body);
    return Products.fromJson(jsonDecode(response.body));
  }

  
}