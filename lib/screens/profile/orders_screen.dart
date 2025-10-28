import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/order.dart';
import '../../providers/order_provider.dart';
import '../../providers/product_provider.dart';
import '../../widgets/appbar/appbar.dart';
import '../../ utils/constants/sizes.dart';
import '../../ utils/constants/colors.dart';
import 'order_detail_screen.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final List<Order> orders = orderProvider.orders;

    return Scaffold(
      appBar: const SAppBar(showbackarrow: true, title: Text('My Orders')),
      body: Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: orders.isEmpty
            ? const Center(child: Text('No orders found.'))
            : ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderDetailScreen(order: order),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.only(
                        bottom: SSizes.spaceBtwItems,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(SSizes.defaultSpace),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Order ID: ${order.id}',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                                Icon(Icons.arrow_forward_ios, size: 16),
                              ],
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
                            Text(
                              'Total: ₹${order.totalAmount.toStringAsFixed(0)}',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: SSizes.spaceBtwItems),
                            // Items List like Cart Screen
                            ...order.items.map((item) {
                              final product = productProvider.products
                                  .firstWhere(
                                    (prod) => prod.id == item.productId,
                                    orElse: () => productProvider
                                        .products
                                        .first, // fallback
                                  );

                              return Card(
                                margin: const EdgeInsets.only(
                                  bottom: SSizes.spaceBtwItems / 2,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                    SSizes.defaultSpace,
                                  ),
                                  child: Row(
                                    children: [
                                      // Product Image
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            SSizes.borderRadiusMd,
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              product.imageUrl,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: SSizes.spaceBtwItems,
                                      ),
                                      // Product Details
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.productName,
                                              style: Theme.of(
                                                context,
                                              ).textTheme.titleMedium,
                                            ),
                                            const SizedBox(
                                              height: SSizes.spaceBtwItems / 2,
                                            ),
                                            Text(
                                              '₹${item.price.toStringAsFixed(0)}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                    color: SColors.primary,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            const SizedBox(
                                              height: SSizes.spaceBtwItems / 2,
                                            ),
                                            // Quantity Display
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal:
                                                        SSizes.spaceBtwItems,
                                                    vertical:
                                                        SSizes.spaceBtwItems /
                                                        2,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: SColors.grey.withOpacity(
                                                  0.1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
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
                                      ),
                                      // Total for item
                                      Text(
                                        '₹${(item.price * item.quantity).toStringAsFixed(0)}',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
