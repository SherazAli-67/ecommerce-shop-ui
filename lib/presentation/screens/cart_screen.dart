import 'package:ecommerce_shop_ui/constants/number_constant.dart';
import 'package:ecommerce_shop_ui/constants/string_const.dart';
import 'package:ecommerce_shop_ui/core/app_colors.dart';
import 'package:ecommerce_shop_ui/core/app_textstyles.dart';
import 'package:ecommerce_shop_ui/core/asset_res.dart';
import 'package:ecommerce_shop_ui/core/models/cart_item_model.dart';
import 'package:ecommerce_shop_ui/presentation/providers/cart_provider.dart';
import 'package:ecommerce_shop_ui/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => CartProvider(), child: const _CartScreenBody(),);
  }
}

class _CartScreenBody extends StatelessWidget {
  const _CartScreenBody();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CartProvider>();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: .fromLTRB(NumberConstant.horizontalPadding, NumberConstant.verticalPadding, NumberConstant.horizontalPadding, NumberConstant.verticalPadding),
          child: Column(
            spacing: NumberConstant.sectionSpacing,
            children: [
              _buildHeader(context),
              Expanded(
                child: ListView.separated(
                  padding: .only(bottom: NumberConstant.verticalPadding),
                  itemCount: provider.items.length,
                  separatorBuilder: (context, index) => const SizedBox(height: NumberConstant.cartItemGap),
                  itemBuilder: (context, index) => _buildCartItem(context, item: provider.items[index]),
                ),
              ),
              _buildFooter(context, total: provider.total),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Stack(
      alignment: .center,
      children: [
        Text(StringConst.myCart, style: AppTextStyles.screenTitle,),
        Align(
          alignment: .centerLeft,
          child: GestureDetector(
            onTap: () => context.go(NamedRoutes.home.routeName),
            behavior: .opaque,
            child: Padding(
              padding: .symmetric(horizontal: 4, vertical: 10),
              child: SvgPicture.asset(AssetRes.icBack, colorFilter: .mode(AppColors.blackColor, .srcIn),),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCartItem(BuildContext context, {required CartItemModel item}) {
    final provider = context.read<CartProvider>();
    return GestureDetector(
      onTap: () => context.push(NamedRoutes.productDetail.productPath(item.productId)),
      child: DecoratedBox(
        decoration: BoxDecoration(color: AppColors.surfaceColor, borderRadius: .circular(NumberConstant.radiusMedium)),
        child: Padding(
          padding: .all(14),
          child: Row(
            spacing: 16,
            children: [
              Expanded(
                flex: 2,
                child: AspectRatio(
                  aspectRatio: NumberConstant.cartThumbAspectRatio,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: item.imageBgColor, borderRadius: .circular(NumberConstant.radiusMedium)),
                    child: Padding(
                      padding: .all(8),
                      child: Image.asset(item.image, fit: .contain,),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  spacing: 18,
                  crossAxisAlignment: .stretch,
                  children: [
                    Row(
                      crossAxisAlignment: .start,
                      children: [
                        Expanded(child: Text(item.name, style: AppTextStyles.cartItemName, maxLines: 1, overflow: .ellipsis,),),
                        Text('${StringConst.sizeLabel} ${item.size}', style: AppTextStyles.cartSize,),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: Text('${StringConst.currencySymbol}${_formatAmount(item.price)}', style: AppTextStyles.price,),),
                        GestureDetector(
                          onTap: () {},
                          child: _buildQuantitySelector(
                            quantity: item.quantity,
                            onDecrement: () => provider.decrement(item.id),
                            onIncrement: () => provider.increment(item.id),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuantitySelector({required int quantity, required VoidCallback onDecrement, required VoidCallback onIncrement}) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: .circular(NumberConstant.radiusMedium),
        border: .all(color: AppColors.qtyBorder),
      ),
      child: Padding(
        padding: .symmetric(horizontal: 10, vertical: 6),
        child: Row(
          spacing: 12,
          mainAxisSize: .min,
          children: [
            GestureDetector(
              onTap: onDecrement,
              behavior: .opaque,
              child: Text('−', style: AppTextStyles.qtyAction,),
            ),
            Text('$quantity', style: AppTextStyles.qtyValue,),
            GestureDetector(
              onTap: onIncrement,
              behavior: .opaque,
              child: Text('+', style: AppTextStyles.qtyAction,),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context, {required double total}) {
    return Column(
      spacing: NumberConstant.sectionSpacing,
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Text(StringConst.total, style: AppTextStyles.totalLabel,),
            Text('${StringConst.currencySymbol}${_formatAmount(total)}', style: AppTextStyles.priceTotal,),
          ],
        ),
        GestureDetector(
          onTap: () {},
          child: DecoratedBox(
            decoration: BoxDecoration(color: AppColors.primaryOrange, borderRadius: .circular(NumberConstant.radiusLarge)),
            child: Padding(
              padding: .symmetric(vertical: 16),
              child: Center(child: Text(StringConst.buyNow, style: AppTextStyles.cta,),),
            ),
          ),
        ),
      ],
    );
  }

  String _formatAmount(double value) {
    final digits = value.toInt().toString();
    final buffer = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      if (i > 0 && (digits.length - i) % 3 == 0) buffer.write(',');
      buffer.write(digits[i]);
    }
    return buffer.toString();
  }
}
