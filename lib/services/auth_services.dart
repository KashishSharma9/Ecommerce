import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_services.dart';
import 'storage_services.dart';
import '../models/user.dart';

class AuthService {
  // Register new user
  static Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await ApiService.post(
      '/auth/register',
      body: {'name': name, 'email': email, 'password': password},
    );

    return ApiService.handleResponse(response);
  }

  // Login user
  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await ApiService.post(
      '/auth/login',
      body: {'email': email, 'password': password},
    );

    final data = ApiService.handleResponse(response);

    // Save token if login successful
    if (data['token'] != null) {
      await StorageService.saveToken(data['token']);
    }

    return data;
  }

  // Get current user
  static Future<Map<String, dynamic>> getMe() async {
    final response = await ApiService.get('/auth/me', requiresAuth: true);
    return ApiService.handleResponse(response);
  }

  // Logout user
  static Future<void> logout() async {
    await StorageService.removeToken();
  }
}
