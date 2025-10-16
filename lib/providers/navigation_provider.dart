import 'package:ecommereceapp/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommereceapp/screens/profile/profile_screen.dart';
import 'package:ecommereceapp/screens/product_detail/product_detail.dart';

class NavigationProvider with ChangeNotifier {
  // Navigate to Profile Screen
  void goToProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileScreen()),
    );
  }

  // Navigate to Product Detail Screen
  void goToProductDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProductDetail()),
    );
  }

  void goToLoginScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }
}


