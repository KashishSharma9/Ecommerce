import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_services.dart';
import '../models/order.dart';

class OrderService {
  // Create new order
  static Future<Order> createOrder({
    required List<Map<String, dynamic>> items,
    required double totalAmount,
    required String shippingAddress,
  }) async {
    final response = await ApiService.post(
      '/orders',
      body: {
        'items': items,
        'totalAmount': totalAmount,
        'shippingAddress': shippingAddress,
      },
      requiresAuth: true,
    );

    final data = ApiService.handleResponse(response);
    return Order.fromJson(data['order']);
  }

  // Get order details by ID
  static Future<Order> getOrderById(String id) async {
    final response = await ApiService.get('/orders/$id', requiresAuth: true);
    final data = ApiService.handleResponse(response);

    return Order.fromJson(data['order']);
  }

  // Get user order history
  static Future<List<Order>> getUserOrders(String userId) async {
    final response = await ApiService.get(
      '/orders/user/$userId',
      requiresAuth: true,
    );
    final data = ApiService.handleResponse(response);

    return (data['orders'] as List)
        .map((order) => Order.fromJson(order))
        .toList();
  }
}
