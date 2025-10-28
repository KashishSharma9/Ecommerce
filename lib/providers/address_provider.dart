import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/address.dart';


class AddressProvider with ChangeNotifier {
  final List<Address> _addresses = [];

  List<Address> get addresses => _addresses;

  void addAddress({
    required String name,
    required String phone,
    required String addressLine,
    required String city,
    required String state,
    required String pincode,
  }) {
    final newAddress = Address(
      id: const Uuid().v4(),
      name: name,
      phone: phone,
      addressLine: addressLine,
      city: city,
      state: state,
      pincode: pincode,
    );
    _addresses.add(newAddress);
    notifyListeners();
  }

  void removeAddress(String id) {
    _addresses.removeWhere((address) => address.id == id);
    notifyListeners();
  }
}
