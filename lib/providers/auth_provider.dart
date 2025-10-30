import 'package:flutter/material.dart';

class UserModel {
  final String id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String address;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.address,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? username,
    String? email,
    String? phone,
    String? address,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }
}

class AuthProvider extends ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;

  AuthProvider() {
    _user = UserModel(
      id: "1",
      name: "Kashish",
      username: "kashish",
      email: "kashish@example.com",
      phone: "+1-234-567-890",
      address: "123 Main St, City, Country",
    );
  }

  UserModel? get user => _user;
  bool get isLoggedIn => _user != null;
  bool get isLoading => _isLoading;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    _user = UserModel(
      id: "1",
      name: "Kashish",
      username: "kashish",
      email: email,
      phone: "+1-234-567-890",
      address: "123 Main St, City, Country",
    );

    _isLoading = false;
    notifyListeners();
  }

  Future<void> signup(String name, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    _user = UserModel(
      id: "2",
      name: name,
      username: name.toLowerCase().replaceAll(' ', '_'),
      email: email,
      phone: "+1-234-567-890",
      address: "123 Main St, City, Country",
    );

    _isLoading = false;
    notifyListeners();
  }

  void updateUser(UserModel updatedUser) {
    _user = updatedUser;
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
