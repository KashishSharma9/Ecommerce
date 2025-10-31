import 'package:flutter/material.dart';

import '../models/product.dart';

class WishlistProvider with ChangeNotifier {
  final List<Product> _wishlist = [];

  List<Product> get wishlist => _wishlist;

  bool isWishlisted(Product product) {
    return _wishlist.any((item) => item.id == product.id);
  }

  void toggleWishlist(Product product) {
    final isAlready = isWishlisted(product);
    if (isAlready) {
      _wishlist.removeWhere((item) => item.id == product.id);
    } else {
      _wishlist.add(product);
    }
    notifyListeners();
  }
}
