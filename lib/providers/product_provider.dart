import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_services.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [];
  bool _isLoading = false;
  String? _error;

  List<Product> get products => [..._products];
  bool get isLoading => _isLoading;
  String? get error => _error;

  List<Product> productsByCategory(String categoryId) {
    return _products.where((prod) => prod.categoryId == categoryId).toList();
  }

  Future<bool> fetchProducts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final fetchedProducts = await ProductService.getAllProducts();
      _products.clear();
      _products.addAll(fetchedProducts);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> fetchProductById(String id) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final product = await ProductService.getProductById(id);
      final existingIndex = _products.indexWhere((p) => p.id == id);
      if (existingIndex >= 0) {
        _products[existingIndex] = product;
      } else {
        _products.add(product);
      }
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> createProduct({
    required String title,
    required String description,
    required double price,
    required String imageUrl,
    required String categoryId,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final newProduct = await ProductService.createProduct(
        title: title,
        description: description,
        price: price,
        imageUrl: imageUrl,
        categoryId: categoryId,
      );
      _products.add(newProduct);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> updateProduct(
    String id, {
    required String title,
    required String description,
    required double price,
    required String imageUrl,
    required String categoryId,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final updatedProduct = await ProductService.updateProduct(
        id,
        title: title,
        description: description,
        price: price,
        imageUrl: imageUrl,
        categoryId: categoryId,
      );
      final existingIndex = _products.indexWhere((p) => p.id == id);
      if (existingIndex >= 0) {
        _products[existingIndex] = updatedProduct;
      }
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> deleteProduct(String id) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await ProductService.deleteProduct(id);
      _products.removeWhere((p) => p.id == id);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
