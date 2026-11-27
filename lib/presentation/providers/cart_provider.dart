import 'package:ecommerce_shop_ui/core/app_data.dart';
import 'package:ecommerce_shop_ui/core/models/cart_item_model.dart';
import 'package:flutter/foundation.dart';

class CartProvider extends ChangeNotifier {
  List<CartItemModel> items = List.of(AppData.cartItems);

  double get total => items.fold(0, (sum, item) => sum + item.price * item.quantity);

  void increment(String id) {
    final index = items.indexWhere((item) => item.id == id);
    if (index < 0) return;
    items[index] = items[index].copyWith(quantity: items[index].quantity + 1);
    notifyListeners();
  }

  void decrement(String id) {
    final index = items.indexWhere((item) => item.id == id);
    if (index < 0 || items[index].quantity <= 1) return;
    items[index] = items[index].copyWith(quantity: items[index].quantity - 1);
    notifyListeners();
  }
}
