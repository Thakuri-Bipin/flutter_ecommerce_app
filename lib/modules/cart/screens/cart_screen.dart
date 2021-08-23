import 'package:ecommerce_bloc/modules/cart/bloc/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: Builder(
        builder: (context) {
          final cart = context.select((CartBloc cartBloc) => cartBloc.cart);
          if (cart.isEmpty) {
            return SizedBox.shrink();
          }
          return CheckoutCard(cart: cart);
        },
      ),
    );
  }

  String buildAppBarContents(cart) {
    if (cart.length > 1) {
      return "${cart.length} items";
    }
    if (cart.length == 1) {
      return "${cart.length} item";
    }
    return "Empty";
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Builder(
            builder: (context) {
              final cart = context.select((CartBloc cartBloc) => cartBloc.cart);
              if (cart.isEmpty) {
                return Text('Empty');
              }
              return Text(
                buildAppBarContents(cart),
                style: Theme.of(context).textTheme.caption,
              );
            },
          ),
        ],
      ),
    );
  }
}
