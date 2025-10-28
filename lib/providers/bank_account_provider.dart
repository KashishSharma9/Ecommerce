import 'package:flutter/material.dart';


import '../models/bank_account.dart';

class BankProvider with ChangeNotifier {
  final List<BankDetail> _banks = [];

  List<BankDetail> get banks => _banks;

  void addBank(BankDetail bank) {
    _banks.add(bank);
    notifyListeners();
  }

  void removeBank(String id) {
    _banks.removeWhere((bank) => bank.id == id);
    notifyListeners();
  }
}
