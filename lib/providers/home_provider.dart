import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int _carousalCurrentIndex = 0;

  int get carousalCurrentIndex => _carousalCurrentIndex;

  void updatePageIndicator(int index) {
    _carousalCurrentIndex = index;
    notifyListeners();

  }
}
