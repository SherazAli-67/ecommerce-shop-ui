import 'package:ecommerce_shop_ui/constants/number_constant.dart';
import 'package:ecommerce_shop_ui/core/app_colors.dart';
import 'package:ecommerce_shop_ui/core/asset_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MainShellScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainShellScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    final index = navigationShell.currentIndex;
    return Container(
      height: NumberConstant.bottomNavHeight,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: .vertical(top: .circular(NumberConstant.radiusLarge)),
      ),
      child: Row(
        mainAxisAlignment: .spaceEvenly,
        children: [
          _buildNavItem(icon: AssetRes.icHome, selected: index == 0, onTap: () => _onTap(0)),
          _buildNavItem(icon: AssetRes.icNavFavorite, selected: index == 1, onTap: () => _onTap(1)),
          _buildNavItem(icon: AssetRes.icCart, selected: index == 2, onTap: () => _onTap(2)),
          _buildNavItem(icon: AssetRes.icProfile, selected: index == 3, onTap: () => _onTap(3)),
        ],
      ),
    );
  }

  Widget _buildNavItem({required String icon, required bool selected, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      behavior: .opaque,
      child: Padding(
        padding: .symmetric(horizontal: 18, vertical: 22),
        child: SvgPicture.asset(icon, colorFilter: .mode(selected ? AppColors.primaryOrange : AppColors.blackColor, .srcIn),),
      ),
    );
  }

  void _onTap(int index) => navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
}
