import 'package:flutter/material.dart';
import '../../ utils/constants/colors.dart';
import '../../ utils/constants/sizes.dart';

import '../../helpers/helper_function.dart';
import '../../widgets/appbar/appbar.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: SAppBar(
        title: const Text('Privacy Policy'),
        showbackarrow: true,
      ),
      backgroundColor: dark ? SColors.dark : Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Privacy Policy",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: SSizes.spaceBtwItems),
            Text(
              "Your privacy is important to us. This Privacy Policy explains how ShopEase collects, uses, and safeguards your personal data.",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: dark ? Colors.white70 : Colors.black87,
                height: 1.5,
              ),
            ),
            const SizedBox(height: SSizes.spaceBtwSections),

            _buildSection(
              context,
              dark,
              title: "1. Information We Collect",
              content:
              "We collect personal information such as your name, email address, and purchase details when you use our app or create an account.",
            ),
            _buildSection(
              context,
              dark,
              title: "2. How We Use Your Information",
              content:
              "Your information is used to provide services, process payments, improve our products, and personalize your experience.",
            ),
            _buildSection(
              context,
              dark,
              title: "3. Data Security",
              content:
              "We use encryption and secure storage systems to protect your personal information against unauthorized access, alteration, or disclosure.",
            ),
            _buildSection(
              context,
              dark,
              title: "4. Sharing of Information",
              content:
              "We do not sell or rent your data. Information is shared only with trusted partners when necessary to deliver our services (e.g., payment gateways).",
            ),
            _buildSection(
              context,
              dark,
              title: "5. Cookies and Tracking",
              content:
              "We may use cookies to enhance your app experience and analyze user activity. You can disable cookies in your device settings if desired.",
            ),
            _buildSection(
              context,
              dark,
              title: "6. Your Rights",
              content:
              "You can request access, modification, or deletion of your personal data anytime by contacting our support team.",
            ),
            _buildSection(
              context,
              dark,
              title: "7. Updates to This Policy",
              content:
              "We may revise our Privacy Policy periodically. Any updates will be reflected in this section, and continued use implies acceptance.",
            ),

            const SizedBox(height: SSizes.spaceBtwSections),
            Divider(color: dark ? Colors.white24 : Colors.black12),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 100),
                child: Text(
                  "Last updated on October 28, 2025",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: dark ? Colors.white54 : Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      // ✅ Bottom Checkbox + Continue Button
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        decoration: BoxDecoration(
          color: dark ? SColors.darkGrey : Colors.grey.shade100,
          border: Border(
            top: BorderSide(
              color: dark ? Colors.white24 : Colors.grey.shade300,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CheckboxListTile(
              value: isAgreed,
              onChanged: (val) {
                setState(() {
                  isAgreed = val ?? false;
                });
              },
              title: const Text("I have read and accept the Privacy Policy"),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: SColors.primary,
              checkColor: SColors.white,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isAgreed
                    ? () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Thank you for accepting our Privacy Policy!'),
                    ),
                  );
                  Navigator.pop(context);
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: SColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    color: SColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Reusable Section Builder
  Widget _buildSection(BuildContext context, bool dark,
      {required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: SSizes.spaceBtwSections),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: dark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: dark ? Colors.white70 : Colors.black87,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
