import 'package:ecommerce_shop_ui/core/app_data.dart';
import 'package:ecommerce_shop_ui/core/app_textstyles.dart';
import 'package:ecommerce_shop_ui/core/asset_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final product = AppData.productById(productId);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Padding(
              padding: .symmetric(horizontal: 16, vertical: 8),
              child: GestureDetector(
                onTap: () => context.pop(),
                behavior: .opaque,
                child: Padding(
                  padding: .symmetric(horizontal: 8, vertical: 10),
                  child: SvgPicture.asset(AssetRes.icBack,),
                ),
              ),
            ),
            Expanded(child: Center(child: Text(product.detailName, style: AppTextStyles.detailTitle,),),),
          ],
        ),
      ),
    );
  }
}
