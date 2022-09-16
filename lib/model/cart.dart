import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:gobble/model/cart_item.dart';
import 'package:gobble/model/product.dart';

class Cart extends ChangeNotifier{
  final List<CartItem> _cart = [];
  
  
  UnmodifiableListView<CartItem> get() => UnmodifiableListView(_cart);

  void add(Product product){
    // Product product;
   CartItem cartItem = _cart.firstWhere((element) => element.id == product.id, orElse: ()=> CartItem(id: product.id, product: product, quantity: 1, amount: product.price));
    int present  = _cart.indexOf(cartItem);
    if (present ==-1){
      _cart.add(cartItem);
      notifyListeners();
    }
    else{
      increaseProduct(cartItem.id);
    }
  }

  void remove(String id){
    CartItem _itemToRemove=_cart.firstWhere((element) => element.id==id );
    _cart.remove(_itemToRemove);
    notifyListeners();
  }

  void increaseProduct(String id){
    late CartItem newItem;
    late int newQuantity;
    late double newAmount;
    
    for (final prod in _cart){
      if(prod.product.id == '$id'){
        newQuantity = prod.quantity + 1;
        newAmount = newQuantity * prod.amount;
        newItem = prod.copyWith(quantity: newQuantity, amount: newAmount);
        int _ = _cart.indexOf(prod);
        _cart.remove(prod);
        _cart.insert(_, newItem);
        notifyListeners();
        break;
      }
    }
  }

  void decreaseProduct(String id){
    late CartItem newItem;
    late int newQuantity;
    late double newAmount;
    
    for (final prod in _cart){
      if(prod.product.id == id){
        if (prod.quantity == 1){
          _cart.remove(prod);
          notifyListeners();
          break;
        }else{
          newQuantity = prod.quantity - 1;
          newAmount = newQuantity * prod.amount;
          newItem = prod.copyWith(quantity: newQuantity, amount: newAmount);
          int _ = _cart.indexOf(prod);
          _cart.remove(prod);
          _cart.insert(_, newItem);
          notifyListeners();
          break;
        }
      }
    }
  }

  double getCartTotal(){
    late double totAmount;
    for (final items in _cart){
      totAmount += items.amount;
    }
    return totAmount;
  }
 
  double obtainCartItemTotalPrice(String id){
    double amount=0;
    for (final items in _cart){
      if(items.id == id){
        amount = items.amount;
        break;
      }
      else{
        amount = 0;
      }
    }
    return amount;
  }

  int obtainCartItemTotalQuantity(String id){
    int amount=0;
    for (final items in _cart){
      if(items.id == id){
        amount = items.quantity;
        break;
      }
      else{
        amount = 0;
      }
    }
    return amount;
  }

}