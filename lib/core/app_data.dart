import 'package:ecommerce_shop_ui/constants/string_const.dart';
import 'package:ecommerce_shop_ui/core/app_colors.dart';
import 'package:ecommerce_shop_ui/core/asset_res.dart';
import 'package:ecommerce_shop_ui/core/models/cart_item_model.dart';
import 'package:ecommerce_shop_ui/core/models/category_model.dart';
import 'package:ecommerce_shop_ui/core/models/offer_model.dart';
import 'package:ecommerce_shop_ui/core/models/product_model.dart';

class AppData {
  static const offers = [
    OfferModel(
      title: StringConst.offerWeekend,
      cta: StringConst.getNow,
      backgroundColor: AppColors.primaryOrangeAlt,
      ctaBackgroundColor: AppColors.whiteColor,
      ctaTextColor: AppColors.primaryOrangeAlt,
      image: AssetRes.imgPromoBags,
    ),
    OfferModel(
      title: StringConst.offerWeekend,
      cta: StringConst.getNow,
      backgroundColor: AppColors.promoBlue,
      ctaBackgroundColor: AppColors.promoGreen,
      ctaTextColor: AppColors.whiteColor,
    ),
  ];

  static const categories = [
    CategoryModel(id: 'watch', icon: AssetRes.icCategoryWatch),
    CategoryModel(id: 'shirt', icon: AssetRes.icCategoryShirt),
    CategoryModel(id: 'bag', icon: AssetRes.icCategoryBag),
    CategoryModel(id: 'sneaker', icon: AssetRes.icCategorySneaker),
    CategoryModel(id: 'glasses', icon: AssetRes.icCategoryGlasses),
  ];

  static const products = [
    ProductModel(
      id: 'redmi_note_4',
      name: StringConst.productRedmi,
      image: AssetRes.imgRedmiBand,
      price: 45000,
      oldPrice: 55000,
      discountLabel: StringConst.discountOff,
      about: StringConst.appleWatchAbout,
      sizes: ['35', '36', '37', '38', '39', '40'],
      colors: [AppColors.colorNavy, AppColors.blackColor, AppColors.whiteColor],
    ),
    ProductModel(
      id: 'apple_watch_6',
      name: StringConst.productAppleWatch,
      detailName: StringConst.productAppleWatchDetail,
      image: AssetRes.imgAppleWatch,
      price: 45000,
      oldPrice: 55000,
      discountLabel: StringConst.discountOff,
      about: StringConst.appleWatchAbout,
      sizes: ['35', '36', '37', '38', '39', '40'],
      colors: [AppColors.colorNavy, AppColors.blackColor, AppColors.whiteColor],
      isFavorite: true,
    ),
    ProductModel(
      id: 'luxury_watch',
      name: StringConst.productLuxuryWatch,
      image: AssetRes.imgLuxuryWatch,
      price: 45000,
      oldPrice: 55000,
      discountLabel: StringConst.discountOff,
      about: StringConst.appleWatchAbout,
      sizes: ['35', '36', '37', '38', '39', '40'],
      colors: [AppColors.colorNavy, AppColors.blackColor, AppColors.whiteColor],
    ),
    ProductModel(
      id: 'casio_watch',
      name: StringConst.productCasio,
      image: AssetRes.imgCasio,
      price: 45000,
      oldPrice: 55000,
      discountLabel: StringConst.discountOff,
      about: StringConst.appleWatchAbout,
      sizes: ['35', '36', '37', '38', '39', '40'],
      colors: [AppColors.colorNavy, AppColors.blackColor, AppColors.whiteColor],
    ),
  ];

  static const cartItems = [
    CartItemModel(
      id: 'cart_1',
      productId: 'apple_watch_6',
      name: StringConst.productAppleCart,
      image: AssetRes.imgAppleWatch,
      price: 45000,
      size: '35',
      quantity: 1,
      imageBgColor: AppColors.cartThumbWatch,
    ),
    CartItemModel(
      id: 'cart_2',
      productId: 'headphones',
      name: StringConst.productHeadphones,
      image: AssetRes.imgHeadphones,
      price: 45000,
      size: 'M',
      quantity: 1,
      imageBgColor: AppColors.cartThumbHeadphones,
    ),
    CartItemModel(
      id: 'cart_3',
      productId: 'shirt',
      name: StringConst.productShirt,
      image: AssetRes.imgShirt,
      price: 45000,
      size: '5',
      quantity: 1,
      imageBgColor: AppColors.cartThumbShirt,
    ),
    CartItemModel(
      id: 'cart_4',
      productId: 'nike',
      name: StringConst.productNike,
      image: AssetRes.imgNike,
      price: 45000,
      size: '42',
      quantity: 1,
      imageBgColor: AppColors.cartThumbNike,
    ),
  ];

  static ProductModel productById(String id) => products.firstWhere((p) => p.id == id, orElse: () => products[1]);
}
