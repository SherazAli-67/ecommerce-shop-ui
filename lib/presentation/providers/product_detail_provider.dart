import 'package:ecommerce_shop_ui/core/models/product_model.dart';
import 'package:flutter/foundation.dart';

class ProductDetailProvider extends ChangeNotifier {
  final ProductModel product;
  int selectedColorIndex;
  String selectedSize;
  int imageIndex;

  ProductDetailProvider({required this.product})
      : selectedColorIndex = 0,
        selectedSize = product.sizes.length > 2 ? product.sizes[2] : product.sizes.first,
        imageIndex = 1;

  void selectColor(int index) {
    if (selectedColorIndex == index) return;
    selectedColorIndex = index;
    notifyListeners();
  }

  void selectSize(String size) {
    if (selectedSize == size) return;
    selectedSize = size;
    notifyListeners();
  }

  void selectImage(int index) {
    if (imageIndex == index) return;
    imageIndex = index;
    notifyListeners();
  }
}
