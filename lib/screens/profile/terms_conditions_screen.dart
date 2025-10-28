import 'package:flutter/material.dart';
import '../../ utils/constants/colors.dart';
import '../../ utils/constants/sizes.dart';
import '../../helpers/helper_function.dart';
import '../../widgets/appbar/appbar.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: SAppBar(
        title: const Text('Terms & Conditions'),
        showbackarrow: true,
      ),
      backgroundColor: dark ? SColors.dark : Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome!",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: SSizes.spaceBtwItems),
            Text(
              "By using this app, you agree to the following terms and conditions. Please read them carefully before continuing.",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: dark ? Colors.white70 : Colors.black87,
                height: 1.5,
              ),
            ),
            const SizedBox(height: SSizes.spaceBtwSections),

            _buildSection(
              context,
              dark,
              title: "1. Account Responsibility",
              content:
              "You are responsible for maintaining the confidentiality of your account and password. Any activity under your account will be your responsibility.",
            ),
            _buildSection(
              context,
              dark,
              title: "2. Use of Services",
              content:
              "Our platform is meant for lawful shopping purposes only. Misuse, fraudulent transactions, or unauthorized access will result in account suspension.",
            ),
            _buildSection(
              context,
              dark,
              title: "3. Product Information",
              content:
              "We strive to provide accurate product details, but occasional inaccuracies may occur. Product availability and pricing are subject to change without notice.",
            ),
            _buildSection(
              context,
              dark,
              title: "4. Payment & Refund Policy",
              content:
              "All payments are processed securely. Refunds, if applicable, will be governed by our Refund Policy, which ensures customer satisfaction and fairness.",
            ),
            _buildSection(
              context,
              dark,
              title: "5. User Conduct",
              content:
              "Users are expected to behave respectfully and avoid any content that is abusive, illegal, or harmful to others on the platform.",
            ),
            _buildSection(
              context,
              dark,
              title: "6. Privacy & Data Protection",
              content:
              "Your data is protected under our Privacy Policy. We never share your personal information with third parties without your consent.",
            ),
            _buildSection(
              context,
              dark,
              title: "7. Limitation of Liability",
              content:
              "We are not liable for indirect, incidental, or consequential damages resulting from the use of our services.",
            ),
            _buildSection(
              context,
              dark,
              title: "8. Changes to Terms",
              content:
              "We may update these terms periodically. Continued use of the app after any modifications indicates your acceptance of the new terms.",
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
              title: const Text("I agree to the Terms and Conditions"),
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
                          'Thank you for accepting our Terms & Conditions!'),
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
