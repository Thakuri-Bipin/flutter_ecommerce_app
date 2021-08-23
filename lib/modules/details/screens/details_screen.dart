import 'package:flutter/material.dart';

import 'package:ecommerce_bloc/modules/details/screens/components/body.dart';
import 'package:ecommerce_bloc/modules/details/screens/components/custom_app_bar.dart';
import 'package:ecommerce_bloc/modules/home/models/product_model.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = "/details";

  final ProductModel product;
  DetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(
        rating: product.rating,
      ),
      // body: Body(product: agrs!.product, cart: cart),
      body: Body(product: product),
    );
  }
}

class ProductDetailsArguments {
  final ProductModel product;

  ProductDetailsArguments({required this.product});
}
