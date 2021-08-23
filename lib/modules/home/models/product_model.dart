import 'package:flutter/material.dart';

class ProductModel {
  final int id;
  final String title, description, category, author;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  bool isFavourite, isPopular;

  ProductModel({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.author,
  });
}
