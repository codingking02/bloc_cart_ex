import 'package:bloc_cart_ex/bloc/cart_bloc.dart';
import 'package:bloc_cart_ex/bloc/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(),
      child: Scaffold(
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
      ),
    );
  }
}
