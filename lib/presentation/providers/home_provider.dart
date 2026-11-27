import 'package:ecommerce_shop_ui/core/app_data.dart';
import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier {
  int selectedCategoryIndex = 0;

  late final Set<String> favoriteIds = {
    for (final product in AppData.products)
      if (product.isFavorite) product.id,
  };

  void selectCategory(int index) {
    if (selectedCategoryIndex == index) return;
    selectedCategoryIndex = index;
    notifyListeners();
  }

  void toggleFavorite(String productId) {
    favoriteIds.contains(productId) ? favoriteIds.remove(productId) : favoriteIds.add(productId);
    notifyListeners();
  }

  bool isFavorite(String productId) => favoriteIds.contains(productId);
}
