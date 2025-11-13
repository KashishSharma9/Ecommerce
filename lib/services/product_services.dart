import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_services.dart';
import '../models/product.dart';

class ProductService {
  // Get all products
  static Future<List<Product>> getAllProducts() async {
    final response = await ApiService.get('/products');
    final data = ApiService.handleResponse(response);

    return (data['products'] as List)
        .map((product) => Product.fromJson(product))
        .toList();
  }

  // Get single product by ID
  static Future<Product> getProductById(String id) async {
    final response = await ApiService.get('/products/$id');
    final data = ApiService.handleResponse(response);

    return Product.fromJson(data['product']);
  }

  // Create new product (Admin only)
  static Future<Product> createProduct({
    required String title,
    required String description,
    required double price,
    required String imageUrl,
    required String categoryId,
  }) async {
    final response = await ApiService.post(
      '/products',
      body: {
        'title': title,
        'description': description,
        'price': price,
        'imageUrl': imageUrl,
        'categoryId': categoryId,
      },
      requiresAuth: true,
    );

    final data = ApiService.handleResponse(response);
    return Product.fromJson(data['product']);
  }

  // Update product (Admin only)
  static Future<Product> updateProduct(
    String id, {
    required String title,
    required String description,
    required double price,
    required String imageUrl,
    required String categoryId,
  }) async {
    final response = await ApiService.put(
      '/products/$id',
      body: {
        'title': title,
        'description': description,
        'price': price,
        'imageUrl': imageUrl,
        'categoryId': categoryId,
      },
      requiresAuth: true,
    );

    final data = ApiService.handleResponse(response);
    return Product.fromJson(data['product']);
  }

  // Delete product (Admin only)
  static Future<void> deleteProduct(String id) async {
    final response = await ApiService.delete(
      '/products/$id',
      requiresAuth: true,
    );
    ApiService.handleResponse(response);
  }
}
