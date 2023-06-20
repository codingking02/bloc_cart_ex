import 'package:bloc_cart_ex/bloc/cart_events.dart';
import 'package:bloc_cart_ex/bloc/cart_state.dart';
import 'package:bloc_cart_ex/data/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvents, CartState> {
  final List<Product> _items = [];
  List<Product> get items => _items;
  CartBloc()
      : super(
          CartEmpty(),
        ) {
    on<AddToCart>(
      (event, emit) {
        _items.add(event.product);
        emit(
          ProductAdd(
            addeditem: _items,
          ),
        );
      },
    );
    on<RemovefromCart>(
      (event, emit) {
        items.remove(
          event.product,
        );
        emit(
          ProductRemove(
            Removeditem: _items,
          ),
        );
      },
    );
  }
}
