import 'dart:convert';
import 'package:http/http.dart' as http;
import 'storage_services.dart';

class ApiService {
  static const String baseUrl =
      'https://dummyjson.com'; // Using dummyjson.com for sample API endpoints

  static Map<String, String> get _headers => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Future<Map<String, String>> get authHeaders async {
    final token = await StorageService.getToken();
    return {..._headers, if (token != null) 'Authorization': 'Bearer $token'};
  }

  static Future<http.Response> _get(
    String endpoint, {
    bool requiresAuth = false,
  }) async {
    final headers = requiresAuth ? await authHeaders : _headers;
    final response = await http.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
    );
    return response;
  }

  static Future<http.Response> _post(
    String endpoint, {
    Map<String, dynamic>? body,
    bool requiresAuth = false,
  }) async {
    final headers = requiresAuth ? await authHeaders : _headers;
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: body != null ? jsonEncode(body) : null,
    );
    return response;
  }

  static Future<http.Response> _put(
    String endpoint, {
    Map<String, dynamic>? body,
    bool requiresAuth = false,
  }) async {
    final headers = requiresAuth ? await authHeaders : _headers;
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
      body: body != null ? jsonEncode(body) : null,
    );
    return response;
  }

  static Future<http.Response> _delete(
    String endpoint, {
    bool requiresAuth = false,
  }) async {
    final headers = requiresAuth ? await authHeaders : _headers;
    final response = await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: headers,
    );
    return response;
  }

  // Helper method to handle responses
  static dynamic handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception('API Error: ${response.statusCode} - ${response.body}');
    }
  }

  // Public methods for services to use
  static Future<http.Response> get(
    String endpoint, {
    bool requiresAuth = false,
  }) async {
    return await _get(endpoint, requiresAuth: requiresAuth);
  }

  static Future<http.Response> post(
    String endpoint, {
    Map<String, dynamic>? body,
    bool requiresAuth = false,
  }) async {
    return await _post(endpoint, body: body, requiresAuth: requiresAuth);
  }

  static Future<http.Response> put(
    String endpoint, {
    Map<String, dynamic>? body,
    bool requiresAuth = false,
  }) async {
    return await _put(endpoint, body: body, requiresAuth: requiresAuth);
  }

  static Future<http.Response> delete(
    String endpoint, {
    bool requiresAuth = false,
  }) async {
    return await _delete(endpoint, requiresAuth: requiresAuth);
  }
}
