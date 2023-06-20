import 'package:bloc_cart_ex/data/product.dart';

abstract class CartEvents {}

class AddToCart extends CartEvents {
  final Product product;
  AddToCart({required this.product});
}

class RemovefromCart extends CartEvents {
  final Product product;

  RemovefromCart({required this.product});
}
