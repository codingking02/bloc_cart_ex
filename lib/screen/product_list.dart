import 'package:bloc_cart_ex/bloc/cart_bloc.dart';
import 'package:bloc_cart_ex/bloc/cart_events.dart';
import 'package:bloc_cart_ex/bloc/cart_state.dart';
import 'package:bloc_cart_ex/data/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Shopping app"),
            actions: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      label: Text(
                        "",
                      ),
                    ),
                  ),
                  BlocConsumer<CartBloc, CartState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Positioned(
                        left: 30,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red,
                          ),
                          child: Text(
                            "${state.cart_items.length}",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: Colors.blueGrey.shade900,
          body: ListView.builder(
            itemCount: getList().length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                color: Colors.blueGrey.shade900,
                child: ListTile(
                  title: Text(
                    "Product $index",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: BlocConsumer<CartBloc, CartState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return IconButton(
                        onPressed: () {
                          if (!state.cart_items.contains(getList()[index])) {
                            context
                                .read<CartBloc>()
                                .add(AddToCart(product: getList()[index]));
                          } else if (state.cart_items
                              .contains(getList()[index])) {
                            context
                                .read<CartBloc>()
                                .add(RemovefromCart(product: getList()[index]));
                          }
                        },
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                        ),
                        color: Colors.white,
                      );
                    },
                  ),
                  leading: Container(
                    width: 100,
                    height: 50,
                    child: Placeholder(
                      color: Colors.primaries[index % Colors.primaries.length],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

List<Product> getList() {
  List<Product> products = List<Product>.generate(
    100,
    (index) {
      return Product(
        name: "Product $index",
        color: Colors.primaries[index % Colors.primaries.length],
      );
    },
  );
  return products;
}
