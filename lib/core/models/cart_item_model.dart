import 'package:flutter/material.dart';

class CartItemModel {
  final String id;
  final String productId;
  final String name;
  final String image;
  final double price;
  final String size;
  final int quantity;
  final Color imageBgColor;

  const CartItemModel({
    required this.id,
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.size,
    required this.quantity,
    required this.imageBgColor,
  });

  CartItemModel copyWith({int? quantity}) => CartItemModel(
        id: id,
        productId: productId,
        name: name,
        image: image,
        price: price,
        size: size,
        quantity: quantity ?? this.quantity,
        imageBgColor: imageBgColor,
      );
}
