import 'package:flutter/material.dart';

class OfferModel {
  final String title;
  final String cta;
  final Color backgroundColor;
  final Color ctaBackgroundColor;
  final Color ctaTextColor;
  final String? image;

  const OfferModel({
    required this.title,
    required this.cta,
    required this.backgroundColor,
    required this.ctaBackgroundColor,
    required this.ctaTextColor,
    this.image,
  });
}
