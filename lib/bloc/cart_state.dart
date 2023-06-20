import 'package:bloc_cart_ex/data/product.dart';

abstract class CartState {
  final List<Product> cart_items;
  CartState({required this.cart_items});
}

class CartEmpty extends CartState {
  CartEmpty() : super(cart_items: []);
}

class CartItemLoading extends CartState {
  CartItemLoading()
      : super(
          cart_items: [],
        );
}

class ProductAdd extends CartState {
  final List<Product> addeditem;
  ProductAdd({required this.addeditem}) : super(cart_items: addeditem);
}

class ProductRemove extends CartState {
  final List<Product> Removeditem;
  ProductRemove({required this.Removeditem}) : super(cart_items: Removeditem);
}
