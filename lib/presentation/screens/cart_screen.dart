import 'package:ecommerce_shop_ui/constants/string_const.dart';
import 'package:ecommerce_shop_ui/core/app_textstyles.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(StringConst.myCart, style: AppTextStyles.screenTitle,),),
    );
  }
}
