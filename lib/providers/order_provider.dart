import 'package:flutter/material.dart';
import '../models/order.dart';
import 'cart_provider.dart';

class OrderProvider with ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => [..._orders];

  void addOrder(
    List<CartItem> cartItems,
    double totalAmount,
    String shippingAddress,
  ) {
    final orderItems = cartItems
        .map(
          (cartItem) => OrderItem(
            productId: cartItem.productId,
            productName: cartItem.title,
            quantity: cartItem.quantity,
            price: cartItem.price,
          ),
        )
        .toList();

    final order = Order(
      id: DateTime.now().toString(),
      userId: 'USER123', // In a real app, get from auth provider
      items: orderItems,
      totalAmount: totalAmount,
      status: 'Pending',
      orderDate: DateTime.now(),
      shippingAddress: shippingAddress,
    );

    _orders.insert(0, order); // Add to beginning of list
    notifyListeners();
  }

  Order? getOrderById(String id) {
    return _orders.firstWhere((order) => order.id == id);
  }
}
