import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_bloc/config/size_config/size_config.dart';
import 'package:ecommerce_bloc/modules/cart/bloc/bloc/cart_bloc.dart';
import 'package:ecommerce_bloc/modules/cart/models/cart_model.dart';
import 'package:ecommerce_bloc/modules/home/models/product_model.dart';
import 'package:ecommerce_bloc/widgets/default_button.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'product_images.dart';
import 'top_rounded_container.dart';

class Body extends StatefulWidget {
  final ProductModel product;

  const Body({required this.product});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _quantity = 1;

  void _quantityIncrement() {
    setState(() {
      _quantity += 1;
    });
  }

  void _quantityDecrement() {
    if (_quantity > 1)
      setState(() {
        _quantity -= 1;
      });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: widget.product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: widget.product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(
                        product: widget.product,
                        increment: _quantityIncrement,
                        decrement: _quantityDecrement,
                        quantity: _quantity),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          onPress: () {
                            BlocProvider.of<CartBloc>(
                              context,
                              listen: false,
                            ).add(
                              CartAdded(
                                cart: CartModel(
                                  numOfItem: _quantity,
                                  product: widget.product,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
