import 'dart:math' as math;

import 'package:ecommerce_shop_ui/constants/number_constant.dart';
import 'package:ecommerce_shop_ui/constants/string_const.dart';
import 'package:ecommerce_shop_ui/core/app_colors.dart';
import 'package:ecommerce_shop_ui/core/app_data.dart';
import 'package:ecommerce_shop_ui/core/app_motion.dart';
import 'package:ecommerce_shop_ui/core/app_textstyles.dart';
import 'package:ecommerce_shop_ui/core/asset_res.dart';
import 'package:ecommerce_shop_ui/presentation/providers/product_detail_provider.dart';
import 'package:ecommerce_shop_ui/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductDetailProvider(product: AppData.productById(productId)),
      child: const _ProductDetailBody(),
    );
  }
}

class _ProductDetailBody extends StatefulWidget {
  const _ProductDetailBody();

  @override
  State<_ProductDetailBody> createState() => _ProductDetailBodyState();
}

class _ProductDetailBodyState extends State<_ProductDetailBody> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: context.read<ProductDetailProvider>().imageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductDetailProvider>();
    final product = provider.product;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: NumberConstant.sectionSpacing,
                crossAxisAlignment: .start,
                children: [
                  _buildHero(context),
                  Padding(
                    padding: .symmetric(horizontal: NumberConstant.horizontalPadding),
                    child: Column(
                      spacing: NumberConstant.sectionSpacing,
                      crossAxisAlignment: .start,
                      children: [
                        Text(product.detailName, style: AppTextStyles.detailTitle,),
                        SvgPicture.asset(AssetRes.icStars,),
                        _buildPriceRow(product.price, product.oldPrice, product.inStock),
                        _buildAbout(product.about),
                        _buildSizeSelector(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: .fromLTRB(NumberConstant.horizontalPadding, 0, NumberConstant.horizontalPadding, NumberConstant.verticalPadding),
              child: _buildAddToCart(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    final provider = context.watch<ProductDetailProvider>();
    final topInset = MediaQuery.paddingOf(context).top;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return AspectRatio(
      aspectRatio: NumberConstant.heroAspectRatio,
      child: Stack(
        clipBehavior: .none,
        children: [
          Positioned(
            top: -screenWidth * 0.2,
            left: -screenWidth * 0.08,
            right: -screenWidth * 0.08,
            child: AspectRatio(
              aspectRatio: 1,
              child: DecoratedBox(decoration: BoxDecoration(color: AppColors.surfaceMuted, shape: .circle),),
            ),
          ),
          PageView.builder(
            itemCount: 3,
            controller: _pageController,
            onPageChanged: provider.selectImage,
            itemBuilder: (context, index) {
              final image = Transform.rotate(
                angle: 15.35 * math.pi / 180,
                child: FractionallySizedBox(
                  widthFactor: 0.72,
                  child: Image.asset(provider.product.image, fit: .contain,),
                ),
              );
              // Single Hero tag — only on the active page to avoid duplicates.
              return Center(
                child: index == provider.imageIndex
                    ? Hero(tag: 'product-image-${provider.product.id}', child: image)
                    : image,
              );
            },
          ),
          Positioned(
            top: topInset + 8,
            left: NumberConstant.horizontalPadding,
            child: GestureDetector(
              onTap: () => context.pop(),
              behavior: .opaque,
              child: Padding(
                padding: .symmetric(horizontal: 4, vertical: 10),
                child: SvgPicture.asset(AssetRes.icBack, colorFilter: .mode(AppColors.blackColor, .srcIn),),
              ),
            ),
          ),
          Positioned(
            right: NumberConstant.horizontalPadding,
            bottom: screenWidth * 0.12,
            child: _buildColorPicker(context),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 12,
            child: _buildDots(provider.imageIndex),
          ),
        ],
      ),
    );
  }

  Widget _buildColorPicker(BuildContext context) {
    final provider = context.watch<ProductDetailProvider>();
    final colors = provider.product.colors;
    return DecoratedBox(
      decoration: BoxDecoration(color: AppColors.surfaceMuted, borderRadius: .circular(NumberConstant.radiusMedium)),
      child: Padding(
        padding: .symmetric(horizontal: 11, vertical: 14),
        child: Column(
          spacing: 10,
          mainAxisSize: .min,
          children: [
            for (var i = 0; i < colors.length; i++)
              GestureDetector(
                onTap: () => provider.selectColor(i),
                child: AnimatedScale(
                  scale: provider.selectedColorIndex == i ? 1.08 : 1,
                  duration: AppMotion.fast,
                  curve: AppMotion.curve,
                  child: AnimatedContainer(
                    duration: AppMotion.fast,
                    curve: AppMotion.curve,
                    decoration: BoxDecoration(
                      color: colors[i],
                      shape: .circle,
                      border: .all(
                        color: provider.selectedColorIndex == i
                            ? AppColors.primaryOrange
                            : colors[i] == AppColors.whiteColor
                                ? AppColors.borderColor
                                : Colors.transparent,
                        width: provider.selectedColorIndex == i ? 2 : 1,
                      ),
                    ),
                    child: Padding(
                      padding: .all(9),
                      child: AnimatedOpacity(
                        opacity: provider.selectedColorIndex == i ? 1 : 0,
                        duration: AppMotion.fast,
                        curve: AppMotion.curve,
                        child: SvgPicture.asset(
                          AssetRes.icCheck,
                          colorFilter: .mode(colors[i] == AppColors.whiteColor ? AppColors.blackColor : AppColors.whiteColor, .srcIn),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDots(int activeIndex) {
    return Row(
      spacing: 17,
      mainAxisAlignment: .center,
      children: [
        for (var i = 0; i < 3; i++)
          AnimatedContainer(
            duration: AppMotion.fast,
            curve: AppMotion.curve,
            width: i == activeIndex ? 18 : 12,
            height: 12,
            decoration: BoxDecoration(
              color: i == activeIndex ? AppColors.activeDot : AppColors.whiteColor,
              borderRadius: .circular(i == activeIndex ? 6 : 12),
              border: i == activeIndex ? null : .all(color: AppColors.borderColor),
            ),
          ),
      ],
    );
  }

  Widget _buildPriceRow(double price, double oldPrice, bool inStock) {
    return Row(
      children: [
        Expanded(
          child: Row(
            spacing: 8,
            children: [
              Text('${StringConst.currencySymbol}${_formatAmount(price)}', style: AppTextStyles.priceLarge,),
              Text('${StringConst.currencySymbol}${_formatAmount(oldPrice)}', style: AppTextStyles.oldPriceLarge,),
            ],
          ),
        ),
        if (inStock) Text(StringConst.availableInStock, style: AppTextStyles.inStock,),
      ],
    );
  }

  Widget _buildAbout(String about) {
    return Column(
      spacing: 12,
      crossAxisAlignment: .start,
      children: [
        Text(StringConst.about, style: AppTextStyles.aboutTitle,),
        Text(about, style: AppTextStyles.aboutBody,),
      ],
    );
  }

  Widget _buildSizeSelector(BuildContext context) {
    final provider = context.watch<ProductDetailProvider>();
    return Row(
      spacing: NumberConstant.sizeChipGap,
      children: [
        for (final size in provider.product.sizes)
          Expanded(
            child: GestureDetector(
              onTap: () => provider.selectSize(size),
              child: AnimatedContainer(
                duration: AppMotion.fast,
                curve: AppMotion.curve,
                decoration: BoxDecoration(
                  color: provider.selectedSize == size ? AppColors.sizeSelectedBg : AppColors.whiteColor,
                  borderRadius: .circular(NumberConstant.radiusChip),
                  border: .all(
                    color: provider.selectedSize == size ? Colors.transparent : AppColors.borderColor,
                  ),
                ),
                child: Padding(
                  padding: .symmetric(vertical: 12),
                  child: Center(
                    child: AnimatedDefaultTextStyle(
                      duration: AppMotion.fast,
                      curve: AppMotion.curve,
                      style: provider.selectedSize == size ? AppTextStyles.sizeLabelSelected : AppTextStyles.sizeLabel,
                      child: Text(size),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildAddToCart(BuildContext context) {
    return _PressScaleButton(
      onTap: () => context.go(NamedRoutes.cart.routeName),
      child: DecoratedBox(
        decoration: BoxDecoration(color: AppColors.primaryOrange, borderRadius: .circular(NumberConstant.radiusLarge)),
        child: Padding(
          padding: .symmetric(vertical: 16),
          child: Center(child: Text(StringConst.addToCart, style: AppTextStyles.cta,),),
        ),
      ),
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

class _PressScaleButton extends StatefulWidget {
  const _PressScaleButton({required this.onTap, required this.child});

  final VoidCallback onTap;
  final Widget child;

  @override
  State<_PressScaleButton> createState() => _PressScaleButtonState();
}

class _PressScaleButtonState extends State<_PressScaleButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1,
        duration: AppMotion.fast,
        curve: AppMotion.curve,
        child: widget.child,
      ),
    );
  }
}
