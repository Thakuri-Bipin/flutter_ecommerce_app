import 'package:ecommerce_bloc/config/size_config/size_config.dart';
import 'package:ecommerce_bloc/modules/cart/bloc/bloc/cart_bloc.dart';
import 'package:ecommerce_bloc/modules/cart/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          Builder(
            builder: (context) {
              final cartState =
                  context.select((CartBloc cartBloc) => cartBloc.cart);

              return IconBtnWithCounter(
                svgSrc: "assets/icons/Cart Icon.svg",
                numOfitem: cartState.length,
                press: () => Navigator.pushNamed(
                  context,
                  CartScreen.routeName,
                ),
              );
            },
          ),
          // IconBtnWithCounter(
          //   svgSrc: "assets/icons/Cart Icon.svg",
          //   numOfitem: 2,
          //   press: () => Navigator.pushNamed(
          //     context,
          //     CartScreen.routeName,
          //   ),
          // ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}
