import 'package:flutter/material.dart';
import '../../ utils/constants/colors.dart';
import '../../ utils/constants/sizes.dart';
import '../../helpers/helper_function.dart';

class MyCouponsScreen extends StatelessWidget {
  const MyCouponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);

    final coupons = [
      {
        "code": "WELCOME50",
        "description": "Get 50% off on your first order!",
        "expiry": "Expires: 31 Dec 2025",
      },
      {
        "code": "FREESHIP",
        "description": "Free shipping on orders above ₹499",
        "expiry": "Expires: 15 Nov 2025",
      },
      {
        "code": "SAVE20",
        "description": "Flat 20% off on electronics",
        "expiry": "Expires: 30 Jan 2026",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Coupons"),
        backgroundColor: dark ? SColors.dark : SColors.primary,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Available Coupons",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: SSizes.spaceBtwSections),

            // 🔹 Coupons List
            Expanded(
              child: coupons.isEmpty
                  ? const Center(
                child: Text("No coupons available right now"),
              )
                  : ListView.builder(
                itemCount: coupons.length,
                itemBuilder: (context, index) {
                  final coupon = coupons[index];
                  return Container(
                    margin: const EdgeInsets.only(
                        bottom: SSizes.spaceBtwItems),
                    decoration: BoxDecoration(
                      color: dark ? SColors.grey : Colors.white,
                      borderRadius:
                      BorderRadius.circular(SSizes.cardRadiusMd),
                      boxShadow: [
                        if (!dark)
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.15),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(SSizes.md),
                      title: Text(
                        coupon["code"]!,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                          color: dark
                              ? Colors.lightBlueAccent
                              : Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          Text(
                            coupon["description"]!,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            coupon["expiry"]!,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Coupon ${coupon["code"]} copied!'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: SColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text("Apply"),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
