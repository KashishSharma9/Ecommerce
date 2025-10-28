import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';
import '../../providers/product_provider.dart';
import '../../ utils/constants/colors.dart';
import '../../ utils/constants/sizes.dart';
import '../checkout/checkout_screen.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: SColors.primary,
      ),
      body: cartProvider.itemCount == 0
          ? const Center(
              child: Text('Your cart is empty'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.items.length,
                    itemBuilder: (ctx, index) {
                      final cartItem = cartProvider.items.values.toList()[index];
                      final product = productProvider.products.firstWhere(
                        (prod) => prod.id == cartItem.productId,
                      );

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: SSizes.defaultSpace,
                          vertical: SSizes.spaceBtwItems / 2,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(SSizes.defaultSpace),
                          child: Row(
                            children: [
                              // Product Image
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(SSizes.borderRadiusMd),
                                  image: DecorationImage(
                                    image: NetworkImage(product.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: SSizes.spaceBtwItems),
                              // Product Details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartItem.title,
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    const SizedBox(height: SSizes.spaceBtwItems / 2),
                                    Text(
                                      '₹${cartItem.price.toStringAsFixed(0)}',
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                        color: SColors.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: SSizes.spaceBtwItems / 2),
                                    // Quantity Controls
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            cartProvider.removeSingleItem(cartItem.productId);
                                          },
                                          icon: const Icon(Icons.remove),
                                        ),
                                        Text(
                                          '${cartItem.quantity}',
                                          style: Theme.of(context).textTheme.bodyLarge,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            cartProvider.addItem(product);
                                          },
                                          icon: const Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Remove Button
                              IconButton(
                                onPressed: () {
                                  cartProvider.removeItem(cartItem.productId);
                                },
                                icon: const Icon(Icons.delete, color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Bottom Section with Total and Checkout
                Container(
                  padding: const EdgeInsets.all(SSizes.defaultSpace),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, -3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total:',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            '₹${cartProvider.totalAmount.toStringAsFixed(0)}',
                            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              color: SColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: SSizes.spaceBtwItems),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const CheckoutScreen()),
                            );
                          },
                          child: const Text('Checkout'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
