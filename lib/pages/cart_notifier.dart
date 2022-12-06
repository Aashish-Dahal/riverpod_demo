import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/model/product.dart';

final cartNotifierProvider =
    ChangeNotifierProvider<CartNotifier>((ref) => CartNotifier());

class CartNotifier extends ChangeNotifier {
  final List<Product> _cart = [];
  List<Product> get cart => _cart;

  void addProduct(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
