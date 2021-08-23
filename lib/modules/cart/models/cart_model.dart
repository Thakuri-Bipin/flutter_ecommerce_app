import 'package:ecommerce_bloc/modules/home/models/product_model.dart';

class CartModel {
  final ProductModel product;
  final int numOfItem;

  CartModel({
    required this.product,
    required this.numOfItem,
  });
}
