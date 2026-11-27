import 'package:ecommerce_shop_ui/constants/string_const.dart';
import 'package:ecommerce_shop_ui/core/app_textstyles.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: .min,
          spacing: 8,
          children: [
            Text(StringConst.favorites, style: AppTextStyles.screenTitle,),
            Text(StringConst.comingSoon, style: AppTextStyles.subtitle,),
          ],
        ),
      ),
    );
  }
}
