import 'package:ecommerce_shop_ui/constants/number_constant.dart';
import 'package:ecommerce_shop_ui/constants/string_const.dart';
import 'package:ecommerce_shop_ui/core/app_colors.dart';
import 'package:ecommerce_shop_ui/core/app_data.dart';
import 'package:ecommerce_shop_ui/core/app_textstyles.dart';
import 'package:ecommerce_shop_ui/core/asset_res.dart';
import 'package:ecommerce_shop_ui/core/models/offer_model.dart';
import 'package:ecommerce_shop_ui/core/models/product_model.dart';
import 'package:ecommerce_shop_ui/presentation/providers/home_provider.dart';
import 'package:ecommerce_shop_ui/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => HomeProvider(), child: const _HomeScreenBody(),);
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: .fromLTRB(NumberConstant.horizontalPadding, NumberConstant.verticalPadding, NumberConstant.horizontalPadding, 0),
          child: Column(
            spacing: NumberConstant.contentSpacing,
            crossAxisAlignment: .start,
            children: [
              Column(
                spacing: NumberConstant.sectionSpacing,
                crossAxisAlignment: .start,
                children: [
                  _buildHeader(),
                  _buildGreeting(),
                  _buildOfferCarousel(context),
                  _buildCategoriesHeader(),
                  _buildCategories(context),
                ],
              ),
              Expanded(child: _buildProductGrid(context),),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        _buildHeaderAction(icon: AssetRes.icMenu),
        _buildHeaderAction(icon: AssetRes.icSearch),
      ],
    );
  }

  Widget _buildHeaderAction({required String icon}) {
    return DecoratedBox(
      //headerCircle, .circle
      decoration: BoxDecoration(color: Colors.transparent, shape: .circle),
      child: Padding(
        padding: .all(10.5),
        //icons, blackColor
        // child: const SizedBox(),
        // child: SvgPicture.asset(icon, colorFilter: .mode(AppColors.blackColor, .srcIn),),
      ),
    );
  }

  Widget _buildGreeting() {
    return Column(
      spacing: 6,
      crossAxisAlignment: .start,
      children: [
        Row(
          spacing: 4,
          children: [
            //${StringConst.greetingPrefix}${StringConst.userName}, greeting,
            //icHandWave
          ],
        ),
        //startShopping
        Text('', style: AppTextStyles.subtitle,),
      ],
    );
  }

  Widget _buildOfferCarousel(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth * NumberConstant.offerViewportFraction;
        final cardHeight = cardWidth / NumberConstant.offerAspectRatio;
        return SizedBox(
          height: cardHeight,
          child: ListView.separated(
            scrollDirection: .horizontal,
            itemCount: AppData.offers.length,
            separatorBuilder: (context, index) => const SizedBox(width: NumberConstant.offerCardGap),
            itemBuilder: (context, index) => _buildOfferCard(offer: AppData.offers[index], width: cardWidth, height: cardHeight),
          ),
        );
      },
    );
  }

  Widget _buildOfferCard({required OfferModel offer, required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      //offer.backgroundColor
      decoration: BoxDecoration(color: Colors.transparent, borderRadius: .circular(NumberConstant.radiusLarge)),
      clipBehavior: .hardEdge,
      child: Stack(
        children: [
          if (offer.image != null)
            Positioned(
              right: -8,
              bottom: -4,
              child: const SizedBox(),
              // child: Image.asset(offer.image!, height: height * 0.85, fit: .contain,),
            ),
          Padding(
            padding: .fromLTRB(19, 24, 19, 16),
            child: Column(
              crossAxisAlignment: .start,
              mainAxisAlignment: .spaceBetween,
              children: [
                SizedBox(
                  width: width * 0.55,
                  //offer.title
                  child: Text('', style: AppTextStyles.offerTitle,),
                ),
                DecoratedBox(
                  //ctaBackgroundColor
                  decoration: BoxDecoration(color: Colors.transparent, borderRadius: .circular(NumberConstant.radiusPill)),
                  child: Padding(
                    padding: .symmetric(horizontal: 16, vertical: 10),
                    //offer.cta
                    child: Text('', style: AppTextStyles.offerCta.copyWith(color: offer.ctaTextColor),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesHeader() {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        //topCategories
        //seeAll
        Text('', style: AppTextStyles.sectionTitle,),
        Text('', style: AppTextStyles.seeAll,),
      ],
    );
  }

  Widget _buildCategories(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    return Row(
      spacing: NumberConstant.categoryGap,
      children: [
        for (var i = 0; i < AppData.categories.length; i++)
          Expanded(
            child: GestureDetector(
              onTap: () => provider.selectCategory(i),
              child: AspectRatio(
                aspectRatio: NumberConstant.categoryAspectRatio,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    // color: provider.selectedCategoryIndex == i ? AppColors.primaryOrangeAlt : AppColors.surfaceAlt,
                    borderRadius: .circular(NumberConstant.radiusSmall),
                    // border: .all(color: AppColors.borderColor, width: NumberConstant.categoryBorderWidth),
                  ),
                  child: Center(
                    child: Padding(
                      padding: .all(12),
                      child: const SizedBox(),
                      /*child: SvgPicture.asset(
                        AppData.categories[i].icon,
                        colorFilter: .mode(provider.selectedCategoryIndex == i ? AppColors.whiteColor : AppColors.blackColor, .srcIn),
                      ),*/
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildProductGrid(BuildContext context) {
    return GridView.builder(
      padding: .only(bottom: NumberConstant.verticalPadding),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: NumberConstant.gridGap,
        mainAxisSpacing: NumberConstant.gridGap,
        childAspectRatio: NumberConstant.productCardAspectRatio,
      ),
      itemCount: AppData.products.length,
      itemBuilder: (context, index) => _buildProductCard(context, product: AppData.products[index]),
    );
  }

  Widget _buildProductCard(BuildContext context, {required ProductModel product}) {
    final provider = context.watch<HomeProvider>();
    final isFavorite = provider.isFavorite(product.id);
    return GestureDetector(
      onTap: () => context.push(NamedRoutes.productDetail.productPath(product.id)),
      child: DecoratedBox(
        //surfaceColor
        decoration: BoxDecoration(color: Colors.transparent, borderRadius: .circular(NumberConstant.radiusLarge)),
        child: Padding(
          padding: .all(12),
          child: Column(
            spacing: 8,
            crossAxisAlignment: .start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    //product.image, fit.contain
                    Positioned.fill(child: const SizedBox(),),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: AppColors.whiteColor, borderRadius: .circular(NumberConstant.radiusDiscount)),
                        child: Padding(
                          padding: .symmetric(horizontal: 6, vertical: 4),
                          //product.discountLabel
                          child: Text('', style: AppTextStyles.discountBadge,),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: GestureDetector(
                        onTap: () => provider.toggleFavorite(product.id),
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: AppColors.whiteColor, shape: .circle),
                          child: Padding(
                            padding: .all(5),
                            child: SizedBox(),
                            /*child: SvgPicture.asset(
                              AssetRes.icHeart,
                              colorFilter: .mode(isFavorite ? AppColors.primaryOrange : AppColors.blackColor, .srcIn),
                            ),*/
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //product.name
              Text('', style: AppTextStyles.productName, maxLines: 1, overflow: .ellipsis,),
              // _buildPriceRow(price: product.price, oldPrice: product.oldPrice),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPriceRow({required double price, required double oldPrice}) {
    return Row(
      spacing: 6,
      children: [
        Text('${StringConst.currencySymbol}${_formatAmount(price)}', style: AppTextStyles.price,),
        Text('${StringConst.currencySymbol}${_formatAmount(oldPrice)}', style: AppTextStyles.oldPrice,),
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
