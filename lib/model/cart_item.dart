import 'package:gobble/model/product.dart';

class CartItem{
  final String id;
  final Product product;
  final int quantity;
  final double amount;

  CartItem({required this.id, required this.product, required this.quantity, required this.amount});

  CartItem copyWith({
    required int quantity,
    required double amount
  }) {
    return CartItem(
      id: id,
      product: product,
      quantity: quantity,
      amount: amount
    );
  }
}

