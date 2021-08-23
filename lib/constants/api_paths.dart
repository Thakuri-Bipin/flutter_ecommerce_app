import 'package:flutter/material.dart';

import 'package:ecommerce_bloc/constants/products_list.dart';
import 'package:ecommerce_bloc/modules/home/models/product_model.dart';

class MainProductsApiProvider {
  // get dummy products data
  Future<List<ProductModel>> getProductsListFromApi() async {
    List<ProductModel> list = [];
    List<Map<String, dynamic>> products =
        productsList['products'] as List<Map<String, dynamic>>;
    products.forEach((element) {
      list.add(
        ProductModel(
          id: element['id'],
          images: element['images'],
          colors: element['colors'] ??
              [
                Color(0xFFF6625E),
                Color(0xFF836DB8),
                Color(0xFFDECB9C),
                Colors.white,
              ],
          title: element['title'],
          price: element['price'],
          description: element['description'],
          category: element['category'],
          author: element['author'],
          rating: element['rating'],
        ),
      );
    });
    // wait for few seconds before returning data
    //Future.delayed(Duration(seconds: 3));

    return list;
  }
}
