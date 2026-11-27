import 'package:ecommerce_shop_ui/constants/string_const.dart';
import 'package:ecommerce_shop_ui/core/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const _font = StringConst.appFontFamily;

  static const greeting = TextStyle(fontFamily: _font, fontWeight: .w600, fontSize: 20, color: AppColors.textPrimary);
  static const subtitle = TextStyle(fontFamily: _font, fontWeight: .w600, fontSize: 12, color: AppColors.textMuted);
  static const sectionTitle = TextStyle(fontFamily: _font, fontWeight: .w600, fontSize: 20, color: AppColors.textPrimary);
  static const seeAll = TextStyle(fontFamily: _font, fontWeight: .w500, fontSize: 16, color: AppColors.primaryOrangeAlt);
  static const offerTitle = TextStyle(fontFamily: _font, fontWeight: .w700, fontSize: 16, color: AppColors.whiteColor);
  static const offerCta = TextStyle(fontFamily: _font, fontWeight: .w700, fontSize: 12, color: AppColors.primaryOrangeAlt);
  static const offerCtaAlt = TextStyle(fontFamily: _font, fontWeight: .w700, fontSize: 12, color: AppColors.whiteColor);
  static const discountBadge = TextStyle(fontFamily: _font, fontWeight: .w600, fontSize: 10, color: AppColors.textSecondary);
  static const productName = TextStyle(fontFamily: _font, fontWeight: .w500, fontSize: 14, color: AppColors.textSecondary);
  static const productNameSmall = TextStyle(fontFamily: _font, fontWeight: .w500, fontSize: 13, color: AppColors.textSecondary);
  static const price = TextStyle(fontFamily: _font, fontWeight: .w800, fontSize: 12.232, color: AppColors.textPrimary);
  static const priceLarge = TextStyle(fontFamily: _font, fontWeight: .w800, fontSize: 16, color: AppColors.textPrimary);
  static const priceTotal = TextStyle(fontFamily: _font, fontWeight: .w800, fontSize: 16.245, color: AppColors.primaryOrange);
  static const oldPrice = TextStyle(fontFamily: _font, fontWeight: .w700, fontSize: 10, color: AppColors.strikethrough, decoration: .lineThrough, decorationColor: AppColors.strikethrough);
  static const oldPriceLarge = TextStyle(fontFamily: _font, fontWeight: .w700, fontSize: 11.477, color: AppColors.strikethrough, decoration: .lineThrough, decorationColor: AppColors.strikethrough);
  static const currency = TextStyle(fontFamily: _font, fontWeight: .w600, fontSize: 16.14, color: AppColors.textPrimary);
  static const currencyTotal = TextStyle(fontFamily: _font, fontWeight: .w600, fontSize: 21.436, color: AppColors.primaryOrange);
  static const screenTitle = TextStyle(fontFamily: _font, fontWeight: .w600, fontSize: 20, color: AppColors.textPrimary);
  static const cartItemName = TextStyle(fontFamily: _font, fontWeight: .w500, fontSize: 14, color: AppColors.textSecondary);
  static const cartSize = TextStyle(fontFamily: _font, fontWeight: .w500, fontSize: 12, color: AppColors.textMuted);
  static const qtyValue = TextStyle(fontFamily: _font, fontWeight: .w500, fontSize: 13, color: AppColors.textPrimary);
  static const qtyAction = TextStyle(fontFamily: _font, fontWeight: .w600, fontSize: 16.14, color: AppColors.primaryOrangeAlt);
  static const totalLabel = TextStyle(fontFamily: _font, fontWeight: .w600, fontSize: 20, color: AppColors.textSecondary);
  static const cta = TextStyle(fontFamily: _font, fontWeight: .w600, fontSize: 16, color: AppColors.whiteColor);
  static const detailTitle = TextStyle(fontFamily: _font, fontWeight: .w600, fontSize: 20, color: AppColors.textSecondary);
  static const inStock = TextStyle(fontFamily: _font, fontWeight: .w600, fontSize: 14, color: AppColors.textPrimary);
  static const aboutTitle = TextStyle(fontFamily: _font, fontWeight: .w600, fontSize: 16, color: AppColors.textPrimary);
  static const aboutBody = TextStyle(fontFamily: _font, fontWeight: .w400, fontSize: 15, color: AppColors.textSecondary);
  static const sizeLabel = TextStyle(fontFamily: _font, fontWeight: .w500, fontSize: 14.284, color: AppColors.textSecondary);
  static const sizeLabelSelected = TextStyle(fontFamily: _font, fontWeight: .w500, fontSize: 14.284, color: AppColors.sizeSelectedText);
}
