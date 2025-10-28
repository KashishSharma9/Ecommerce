import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ utils/constants/colors.dart';
import '../../ utils/constants/sizes.dart';
import '../../providers/cart_provider.dart';
import '../../providers/order_provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _roadController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  String _selectedPayment = 'UPI'; // Default payment method
  bool _isAddressSaved = false;

  bool get _isAddressComplete =>
      _nameController.text.isNotEmpty &&
      _numberController.text.isNotEmpty &&
      _streetController.text.isNotEmpty &&
      _roadController.text.isNotEmpty &&
      _pincodeController.text.isNotEmpty;

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _streetController.dispose();
    _roadController.dispose();
    _pincodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final double subtotal = cartProvider.totalAmount;
    final double shipping = 100.0; // Fixed shipping cost in INR
    final double total = subtotal + shipping;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: SColors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Shipping Address Section
              Text(
                'Shipping Address',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: SSizes.spaceBtwItems),
              Container(
                padding: const EdgeInsets.all(SSizes.defaultSpace),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(SSizes.borderRadiusMd),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        hintText: 'Name',
                        border: InputBorder.none,
                      ),
                    ),
                    const SizedBox(height: SSizes.spaceBtwItems),
                    TextField(
                      controller: _numberController,
                      decoration: const InputDecoration(
                        hintText: 'Phone Number',
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: SSizes.spaceBtwItems),
                    TextField(
                      controller: _streetController,
                      decoration: const InputDecoration(
                        hintText: 'Street',
                        border: InputBorder.none,
                      ),
                    ),
                    const SizedBox(height: SSizes.spaceBtwItems),
                    TextField(
                      controller: _roadController,
                      decoration: const InputDecoration(
                        hintText: 'Road',
                        border: InputBorder.none,
                      ),
                    ),
                    const SizedBox(height: SSizes.spaceBtwItems),
                    TextField(
                      controller: _pincodeController,
                      decoration: const InputDecoration(
                        hintText: 'Pincode',
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: SSizes.spaceBtwItems),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Save address logic
                          setState(() {
                            _isAddressSaved = true;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Address saved')),
                          );
                        },
                        child: const Text('Save Address'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: SSizes.spaceBtwSections),

              // Payment Method Section - Only show if address is saved
              if (_isAddressSaved) ...[
                Text(
                  'Payment Method',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: SSizes.spaceBtwItems),
                Column(
                  children: [
                    // UPI Option
                    Container(
                      padding: const EdgeInsets.all(SSizes.defaultSpace),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(
                          SSizes.borderRadiusMd,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.account_balance_wallet),
                          const SizedBox(width: SSizes.spaceBtwItems),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'UPI',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                                const Text(
                                  'Pay using UPI apps like Google Pay, PhonePe',
                                ),
                              ],
                            ),
                          ),
                          Radio<String>(
                            value: 'UPI',
                            groupValue: _selectedPayment,
                            onChanged: (value) {
                              setState(() {
                                _selectedPayment = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: SSizes.spaceBtwItems),
                    // Card Option
                    Container(
                      padding: const EdgeInsets.all(SSizes.defaultSpace),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(
                          SSizes.borderRadiusMd,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.credit_card),
                          const SizedBox(width: SSizes.spaceBtwItems),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Credit/Debit Card',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                                const Text('Visa, MasterCard, etc.'),
                              ],
                            ),
                          ),
                          Radio<String>(
                            value: 'Card',
                            groupValue: _selectedPayment,
                            onChanged: (value) {
                              setState(() {
                                _selectedPayment = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: SSizes.spaceBtwItems),
                    // Cash on Delivery Option
                    Container(
                      padding: const EdgeInsets.all(SSizes.defaultSpace),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(
                          SSizes.borderRadiusMd,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.money),
                          const SizedBox(width: SSizes.spaceBtwItems),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cash on Delivery',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                                const Text('Pay when you receive the order'),
                              ],
                            ),
                          ),
                          Radio<String>(
                            value: 'COD',
                            groupValue: _selectedPayment,
                            onChanged: (value) {
                              setState(() {
                                _selectedPayment = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: SSizes.spaceBtwSections),
              ],
              const SizedBox(height: SSizes.spaceBtwSections),

              // Order Summary Section
              Text(
                'Order Summary',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: SSizes.spaceBtwItems),
              Container(
                padding: const EdgeInsets.all(SSizes.defaultSpace),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(SSizes.borderRadiusMd),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Subtotal'),
                        Text('₹${subtotal.toStringAsFixed(0)}'),
                      ],
                    ),
                    const SizedBox(height: SSizes.spaceBtwItems / 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Shipping'),
                        Text('₹${shipping.toStringAsFixed(0)}'),
                      ],
                    ),
                    const SizedBox(height: SSizes.spaceBtwItems / 2),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          '₹${total.toStringAsFixed(0)}',
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: SSizes.spaceBtwSections),

              // Place Order Button
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: SSizes.spaceBtwSections),
                child: ElevatedButton(
                  onPressed: _isAddressSaved
                      ? () {
                          // Create order from cart items
                          final orderProvider = Provider.of<OrderProvider>(
                            context,
                            listen: false,
                          );
                          final shippingAddress =
                              '${_nameController.text}, ${_numberController.text}, ${_streetController.text}, ${_roadController.text}, ${_pincodeController.text}';
                          orderProvider.addOrder(
                            cartProvider.items.values.toList(),
                            total,
                            shippingAddress,
                          );

                          // Clear cart and navigate back to home page
                          cartProvider.clearCart();
                          Navigator.of(
                            context,
                          ).popUntil((route) => route.isFirst);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Order placed successfully'),
                            ),
                          );
                        }
                      : null,
                  child: const Text('Place Order'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
