import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: '1',
      title: 'Nike Air Shoes',
      price: 2800.0,
      imageUrl: 'https://example.com/shoe.jpg',
    ),
    Product(
      id: '2',
      title: 'Adidas T-Shirt',
      price: 1200.0,
      imageUrl: 'https://example.com/shirt.jpg',
    ),
  ];

  List<Product> get products => _products;
}
