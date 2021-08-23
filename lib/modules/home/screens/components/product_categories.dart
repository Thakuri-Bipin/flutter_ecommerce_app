import 'package:ecommerce_bloc/modules/category_products/screens/category_products_screen.dart';
import 'package:ecommerce_bloc/widgets/product_card.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_bloc/config/size_config/size_config.dart';
import 'package:ecommerce_bloc/modules/home/models/product_model.dart';

import 'section_title.dart';

class ProductCategories extends StatelessWidget {
  final String productCategory;
  final List<ProductModel> products;

  ProductCategories({
    required this.productCategory,
    required this.products,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: getProportionateScreenWidth(10)),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SectionTitle(
              title: productCategory,
              press: () {
                Navigator.of(context).pushNamed(
                  CategoryProductsScreen.routeName,
                  arguments: CategoryProductsArguments(
                    products: products,
                    category: productCategory,
                  ),
                );
              }),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                products.length,
                (index) {
                  return ProductCard(
                    product: products[index],
                  );
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
