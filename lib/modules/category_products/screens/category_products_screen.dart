import 'package:flutter/material.dart';

import 'package:ecommerce_bloc/modules/category_products/screens/components/body.dart';
import 'package:ecommerce_bloc/modules/home/models/product_model.dart';

class CategoryProductsScreen extends StatelessWidget {
  static const routeName = '/category-products';

  final List<ProductModel> products;
  final String category;

  CategoryProductsScreen({
    required this.products,
    required this.category,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category'),
      ),
      body: Body(products: products),
    );
  }
}

class CategoryProductsArguments {
  final List<ProductModel> products;
  final String category;

  CategoryProductsArguments({
    required this.products,
    required this.category,
  });
}
