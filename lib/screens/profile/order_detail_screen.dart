import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/order.dart';
import '../../providers/product_provider.dart';
import '../../widgets/appbar/appbar.dart';
import '../../ utils/constants/sizes.dart';
import '../../ utils/constants/colors.dart';

class OrderDetailScreen extends StatelessWidget {
  final Order order;

  const OrderDetailScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: const SAppBar(showbackarrow: true, title: Text('Order Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary
            Card(
              child: Padding(
                padding: const EdgeInsets.all(SSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order ID: ${order.id}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: SSizes.spaceBtwItems / 2),
                    Text(
                      'Status: ${order.status}',
                      style: TextStyle(
                        color: order.status == 'Delivered'
                            ? Colors.green
                            : Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: SSizes.spaceBtwItems / 2),
                    Text(
                      'Order Date: ${order.orderDate.toLocal().toString().split(' ')[0]}',
                    ),
                    const SizedBox(height: SSizes.spaceBtwItems / 2),
                    Text('Shipping Address: ${order.shippingAddress}'),
                    const SizedBox(height: SSizes.spaceBtwItems / 2),
                    Text(
                      'Total: ₹${order.totalAmount.toStringAsFixed(0)}',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: SSizes.spaceBtwSections),

            // Items List
            Text(
              'Items Ordered',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: SSizes.spaceBtwItems),
            ...order.items.map(
              (item) => Card(
                margin: const EdgeInsets.only(bottom: SSizes.spaceBtwItems),
                child: Padding(
                  padding: const EdgeInsets.all(SSizes.defaultSpace),
                  child: Row(
                    children: [
                      // Product Image
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            SSizes.borderRadiusMd,
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              productProvider.products
                                  .firstWhere(
                                    (prod) => prod.id == item.productId,
                                    orElse: () => productProvider
                                        .products
                                        .first, // fallback
                                  )
                                  .imageUrl,
                            ),
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
                              item.productName,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: SSizes.spaceBtwItems / 2),
                            Text(
                              '₹${item.price.toStringAsFixed(0)}',
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .copyWith(
                                    color: SColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: SSizes.spaceBtwItems / 2),
                            // Quantity Controls like Cart
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: SSizes.spaceBtwItems,
                                    vertical: SSizes.spaceBtwItems / 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: SColors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(
                                      SSizes.borderRadiusMd,
                                    ),
                                  ),
                                  child: Text(
                                    'Qty: ${item.quantity}',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Total for item
                      Text(
                        '₹${(item.price * item.quantity).toStringAsFixed(0)}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
