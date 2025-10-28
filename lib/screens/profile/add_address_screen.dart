import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ utils/constants/colors.dart';
import '../../helpers/helper_function.dart';
import '../../providers/address_provider.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final pincodeController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    pincodeController.dispose();
    super.dispose();
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
        style: TextStyle(
          color: dark ? Colors.white : Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: dark ? Colors.white70 : Colors.grey.shade700),
          labelText: label,
          labelStyle: TextStyle(
            color: dark ? Colors.white70 : Colors.black54,
          ),
          filled: true,
          fillColor: dark ? const Color(0xFF2A2A2A) : Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
                color: dark ? Colors.white70 : Colors.blueAccent, width: 1.5),
          ),
        ),
        validator: validator ??
                (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter $label';
              }
              return null;
            },
      ),
    );
  }

  void _saveAddress() {
    if (_formKey.currentState!.validate()) {
      // ✅ Add the new address to the provider
      Provider.of<AddressProvider>(context, listen: false).addAddress(
        name: nameController.text,
        phone: phoneController.text,
        addressLine: addressController.text,
        city: cityController.text,
        state: stateController.text,
        pincode: pincodeController.text,
      );

      // ✅ Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Address saved successfully!')),
      );

      // ✅ Pop back to AddressScreen
      Navigator.pop(context);
    }
  }


  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context) ;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Address'),
        backgroundColor: dark ? SColors.dark : SColors.primary,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top:60, left: 20, right: 20),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 600),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: dark ?   SColors.dark : SColors.light,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  if (!dark)
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    )
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildFormField(
                      label: 'Full Name',
                      controller: nameController,
                      icon: Icons.person_outline,
                    ),
                    _buildFormField(
                      label: 'Phone',
                      controller: phoneController,
                      icon: Icons.phone,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter phone number';
                        }
                        if (value.length < 10) {
                          return 'Enter valid phone number';
                        }
                        return null;
                      },
                    ),
                    _buildFormField(
                      label: 'Address',
                      controller: addressController,
                      icon: Icons.home_outlined,
                    ),
                    _buildFormField(
                      label: 'City',
                      controller: cityController,
                      icon: Icons.location_city,
                    ),
                    _buildFormField(
                      label: 'State',
                      controller: stateController,
                      icon: Icons.location_searching,
                    ),
                    _buildFormField(
                      label: 'Pincode',
                      controller: pincodeController,
                      icon: Icons.pin_drop_outlined,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter pincode';
                        }
                        if (value.length != 6) {
                          return 'Enter valid 6-digit pincode';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: _saveAddress,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        backgroundColor: SColors.primary,
                      ),
                      child: Text(
                        'Save Address',
                        style: TextStyle(
                          color: SColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
