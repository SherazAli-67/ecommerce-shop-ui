import 'package:flutter/material.dart';

class ProductModel {
  final String id;
  final String name;
  final String detailName;
  final String image;
  final double price;
  final double oldPrice;
  final String discountLabel;
  final String about;
  final List<String> sizes;
  final List<Color> colors;
  final double rating;
  final bool inStock;
  final bool isFavorite;

  const ProductModel({
    required this.id,
    required this.name,
    String? detailName,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.discountLabel,
    required this.about,
    required this.sizes,
    required this.colors,
    this.rating = 5,
    this.inStock = true,
    this.isFavorite = false,
  }) : detailName = detailName ?? name;
}
