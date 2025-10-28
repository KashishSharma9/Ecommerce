import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import '../../ utils/constants/colors.dart';
import '../../ utils/constants/sizes.dart';
import '../../helpers/helper_function.dart';
import '../../models/bank_account.dart';
import '../../providers/bank_account_provider.dart';

class AddBankAccount extends StatefulWidget {
  const AddBankAccount({Key? key}) : super(key: key);

  @override
  State<AddBankAccount> createState() => _AddBankScreenState();
}

class _AddBankScreenState extends State<AddBankAccount> {
  final _formKey = GlobalKey<FormState>();

  final accountHolderController = TextEditingController();
  final bankNameController = TextEditingController();
  final accountNumberController = TextEditingController();
  final ifscController = TextEditingController();
  final branchController = TextEditingController();

  @override
  void dispose() {
    accountHolderController.dispose();
    bankNameController.dispose();
    accountNumberController.dispose();
    ifscController.dispose();
    branchController.dispose();
    super.dispose();
  }

  void _saveBankDetails() {
    if (_formKey.currentState!.validate()) {
      final newBank = BankDetail(
        id: Random().nextDouble().toString(),
        accountHolderName: accountHolderController.text.trim(),
        bankName: bankNameController.text.trim(),
        accountNumber: accountNumberController.text.trim(),
        ifscCode: ifscController.text.trim(),
        branchName: branchController.text.trim(),
      );

      Provider.of<BankProvider>(context, listen: false).addBank(newBank);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bank details saved successfully!')),
      );

      Navigator.pop(context);
    }
  }

  // --- Withdraw Bottom Sheet ---
  void _showWithdrawBottomSheet(BuildContext context) {
    final withdrawController = TextEditingController();
    final dark = SHelperFunctions.isDarkMode(context);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: dark ? SColors.darkGrey : Colors.white,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 5,
              width: 50,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Text(
              "Withdraw Balance",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: SSizes.spaceBtwSections),
            TextFormField(
              controller: withdrawController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter amount to withdraw",
                prefixIcon: Icon(Icons.currency_rupee),
              ),
            ),
            const SizedBox(height: SSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final amount = withdrawController.text.trim();
                  if (amount.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Enter an amount')),
                    );
                    return;
                  }
                  Navigator.pop(context); // Close bottom sheet
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('₹$amount withdrawn successfully!'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: SColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text("Withdraw Now"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(color: dark ? Colors.white : Colors.black),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: dark ? Colors.white70 : Colors.grey.shade700),
          labelText: label,
          labelStyle: TextStyle(color: dark ? Colors.white70 : Colors.black54),
          filled: true,
          fillColor: dark ? const Color(0xFF2A2A2A) : Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: dark ? Colors.white70 : Colors.blueAccent, width: 1.5),
          ),
        ),
        validator: validator ??
                (value) {
              if (value == null || value.isEmpty) return 'Please enter $label';
              return null;
            },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Bank Details'),
        backgroundColor: dark ? SColors.dark : SColors.primary,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildFormField(
                  label: 'Account Holder Name',
                  controller: accountHolderController,
                  icon: Icons.person_outline,
                ),
                _buildFormField(
                  label: 'Bank Name',
                  controller: bankNameController,
                  icon: Icons.account_balance,
                ),
                _buildFormField(
                  label: 'Account Number',
                  controller: accountNumberController,
                  icon: Icons.credit_card,
                  keyboardType: TextInputType.number,
                ),
                _buildFormField(
                  label: 'IFSC Code',
                  controller: ifscController,
                  icon: Icons.qr_code,
                ),
                _buildFormField(
                  label: 'Branch',
                  controller: branchController,
                  icon: Icons.location_city,
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: _saveBankDetails,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    backgroundColor: SColors.primary,
                  ),
                  child: Text(
                    'Save Bank Details',
                    style: TextStyle(
                      color: SColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Withdraw button
                ElevatedButton.icon(
                  onPressed: () => _showWithdrawBottomSheet(context),
                  icon: const Icon(Icons.account_balance_wallet_outlined),
                  label: const Text("Withdraw Balance"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: dark ? Colors.tealAccent[700] : Colors.teal,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
