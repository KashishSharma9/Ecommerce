import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_services.dart';
import '../models/cart.dart';

class CartService {
  // Add item to cart
  static Future<Map<String, dynamic>> addToCart({
    required String productId,
    required int quantity,
  }) async {
    final response = await ApiService.post(
      '/cart',
      body: {'productId': productId, 'quantity': quantity},
      requiresAuth: true,
    );

    return ApiService.handleResponse(response);
  }

  // Get cart items
  static Future<List<CartItem>> getCart() async {
    final response = await ApiService.get('/cart', requiresAuth: true);
    final data = ApiService.handleResponse(response);

    return (data['cartItems'] as List)
        .map((item) => CartItem.fromJson(item))
        .toList();
  }

  // Update cart item quantity
  static Future<Map<String, dynamic>> updateCartItem({
    required String productId,
    required int quantity,
  }) async {
    final response = await ApiService.put(
      '/cart',
      body: {'productId': productId, 'quantity': quantity},
      requiresAuth: true,
    );

    return ApiService.handleResponse(response);
  }

  // Remove item from cart
  static Future<void> removeFromCart(String productId) async {
    final response = await ApiService.delete(
      '/cart/$productId',
      requiresAuth: true,
    );
    ApiService.handleResponse(response);
  }

  // Clear cart
  static Future<void> clearCart() async {
    final response = await ApiService.delete('/cart', requiresAuth: true);
    ApiService.handleResponse(response);
  }
}
