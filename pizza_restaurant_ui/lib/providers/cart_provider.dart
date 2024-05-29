import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';

import '../models/cart.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  Cart cart = Cart();

  void addToCart(Product product) {
    CartItem? existingItem = findInCart(product);
    if (existingItem != null) {
      existingItem.count++;
    } else {
      cart.items.add(CartItem(product, 1));
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    cart.items.removeWhere((item) => item.product.productID == product.productID);
    notifyListeners();
  }

  CartItem? findInCart(Product product) {
    return cart.items.firstWhereOrNull((item) => item.product.productID == product.productID);
  }
}
