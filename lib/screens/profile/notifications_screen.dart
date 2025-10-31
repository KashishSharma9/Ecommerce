import 'package:flutter/material.dart';
import '../../ utils/constants/colors.dart';
import '../../ utils/constants/sizes.dart';
import '../../helpers/helper_function.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);

    // Sample notifications — can be connected to backend or local data
    final notifications = [
      {
        "title": "Order Delivered 🎉",
        "message": "Your order #12345 has been successfully delivered.",
        "time": "2h ago"
      },
      {
        "title": "Limited Offer 💥",
        "message": "Flat 30% OFF on Electronics. Hurry up!",
        "time": "6h ago"
      },
      {
        "title": "Order Shipped 🚚",
        "message": "Your order #12345 has been shipped.",
        "time": "1d ago"
      },
      {
        "title": "New Arrivals 👗",
        "message": "Check out the latest collection in the store.",
        "time": "2d ago"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: dark ? SColors.dark : SColors.primary,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: ListView.separated(
          itemCount: notifications.length,
          separatorBuilder: (context, index) =>
          const SizedBox(height: SSizes.spaceBtwItems),
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return Container(
              decoration: BoxDecoration(
                color: dark ? SColors.grey : Colors.white,
                borderRadius: BorderRadius.circular(SSizes.cardRadiusMd),
                boxShadow: [
                  if (!dark)
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                ],
              ),
              padding: const EdgeInsets.all(SSizes.md),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.notifications_active_outlined,
                    color: dark ? Colors.white70 : SColors.primary,
                    size: 28,
                  ),
                  const SizedBox(width: SSizes.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification["title"]!,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          notification["message"]!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                              color: dark
                                  ? Colors.white70
                                  : Colors.black87),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          notification["time"]!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                              color: dark
                                  ? Colors.white54
                                  : Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
