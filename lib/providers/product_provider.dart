import 'package:flutter/material.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String categoryId;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
  });
}

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: 'p1',
      title: 'Men T-Shirt',
      description: 'Comfortable cotton t-shirt',
      price: 2000.0,
      imageUrl:
      'https://images.unsplash.com/photo-1598970434795-0c54fe7c0642?auto=format&fit=crop&w=800&q=60',
      categoryId: 'c1',
    ),
    Product(
      id: 'p2',
      title: 'Women Dress',
      description: 'Elegant summer dress',
      price: 3600.0,
      imageUrl:
      'https://images.unsplash.com/photo-1503341455253-b2e723bb3dbb?auto=format&fit=crop&w=800&q=60',
      categoryId: 'c2',
    ),
    Product(
      id: 'p3',
      title: 'Kids Toy',
      description: 'Safe and fun toy for kids',
      price: 1200.0,
      imageUrl:
      'https://images.unsplash.com/photo-1537044374019-857d0e2d0a2f?auto=format&fit=crop&w=800&q=60',
      categoryId: 'c3',
    ),
    Product(
      id: 'p4',
      title: 'Headphones',
      description: 'Wireless over-ear headphones',
      price: 6800.0,
      imageUrl:
      'https://images.unsplash.com/photo-1518449071786-2f0f6e0ed82d?auto=format&fit=crop&w=800&q=60',
      categoryId: 'c5',
    ),
    Product(
      id: 'p5',
      title: 'Sunglasses',
      description: 'Stylish UV protection sunglasses',
      price: 2400.0,
      imageUrl:
      'https://images.unsplash.com/photo-1541099649105-f69ad21f3246?auto=format&fit=crop&w=800&q=60',
      categoryId: 'c4',
    ),
    Product(
      id: 'p6',
      title: 'Nike Air Shoes',
      description: 'Comfortable running shoes',
      price: 2800.0,
      imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=800&q=60',
      categoryId: 'c6',
    ),
  ];

  List<Product> get products => [..._products];

  List<Product> productsByCategory(String categoryId) {
    return _products.where((prod) => prod.categoryId == categoryId).toList();
  }
}
