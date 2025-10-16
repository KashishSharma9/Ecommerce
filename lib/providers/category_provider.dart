import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final String imageUrl;

  Category({
    required this.id,
    required this.title,
    required this.imageUrl,
  });
}

class CategoryProvider with ChangeNotifier {
  final List<Category> _categories = [
    Category(
      id: 'c1',
      title: 'Fashion',
      imageUrl:
      'https://img.icons8.com/external-flatart-icons-outline-flatarticons/512/external-fashion-clothes-flatart-icons-outline-flatarticons.png',
    ),
    Category(
      id: 'c2',
      title: 'Electronics',
      imageUrl:
      'https://img.icons8.com/external-flatart-icons-outline-flatarticons/512/external-gadget-electronic-devices-flatart-icons-outline-flatarticons.png',
    ),
    Category(
      id: 'c3',
      title: 'Groceries',
      imageUrl:
      'https://img.icons8.com/external-flatart-icons-outline-flatarticons/512/external-groceries-supermarket-flatart-icons-outline-flatarticons.png',
    ),
    Category(
      id: 'c4',
      title: 'Beauty',
      imageUrl:
      'https://img.icons8.com/external-flatart-icons-outline-flatarticons/512/external-cosmetics-beauty-flatart-icons-outline-flatarticons.png',
    ),
    Category(
      id: 'c5',
      title: 'Home',
      imageUrl:
      'https://img.icons8.com/external-flatart-icons-outline-flatarticons/512/external-furniture-interior-flatart-icons-outline-flatarticons.png',
    ),
  ];

  List<Category> get categories {
    return [..._categories];
  }
}
