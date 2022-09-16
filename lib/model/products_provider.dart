import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:gobble/model/parser.dart';
import 'package:gobble/model/product.dart';
import 'package:gobble/model/products.dart';

class ProductsProvider extends ChangeNotifier{
  final List<Product> _productsList = [];
  late List<Product> _favouriteList;

  bool loaded = false;
  bool isEmpty = false;
 
  ProductsProvider(){
    _favouriteList =_productsList.where((element) => element.isFavourite==true).toList();
    isEmpty = _favouriteList.isEmpty;
    populateList();
  }

  UnmodifiableListView<Product> getProducts() => UnmodifiableListView(_productsList);
  UnmodifiableListView<Product> getFavourite() => UnmodifiableListView(_favouriteList);

  void populateList() async{
    Products _ =  await ParseProducts().getProducts();
    _.data.forEach((element) {_productsList.add(element);});
    loaded= true;
    notifyListeners();
  }

  void toggleFavouite(String id){
    for(final e in _productsList){
      if (e.id == id){
        e.isFavourite = !e.isFavourite;
        _favouriteList =_productsList.where((element) => element.isFavourite==true).toList();
        print(_favouriteList);
        isEmpty = _favouriteList.isEmpty;
        notifyListeners();
        break;
      }
    }
  }

  // bool isEmptyFavourite(){
  //   return _favouriteList.isEmpty;
  // }

  Product obtainProduct(String id){
    return _productsList.firstWhere((element) => element.id == id);
  }



  
}