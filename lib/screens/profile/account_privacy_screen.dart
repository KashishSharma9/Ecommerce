import 'package:ecommereceapp/screens/profile/change_password_screen.dart';
import 'package:ecommereceapp/screens/profile/privacy_screen.dart';
import 'package:ecommereceapp/screens/profile/terms_conditions_screen.dart';
import 'package:flutter/material.dart';
import '../../ utils/constants/colors.dart';
import '../../ utils/constants/sizes.dart';
import '../../helpers/helper_function.dart';
import '../../widgets/appbar/appbar.dart';

class AccountPrivacyScreen extends StatefulWidget {
  const AccountPrivacyScreen({super.key});

  @override
  State<AccountPrivacyScreen> createState() => _AccountPrivacyScreenState();
}

class _AccountPrivacyScreenState extends State<AccountPrivacyScreen> {
  bool showNameInReviews = true;
  bool personalizedRecommendations = true;
  bool pushNotifications = true;
  bool twoStepVerification = false;



  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: SAppBar(
        title: const Text('Account Privacy'),
        showbackarrow: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        children: [
          Text(
            'Privacy Preferences',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: SSizes.spaceBtwItems),

          // ✅ Visibility & Notification Toggles
          Card(
            color: dark ? SColors.grey : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                SwitchListTile(
                  value: showNameInReviews,
                  onChanged:
                      (val) {
                    setState(() => showNameInReviews = val);
                  },
                  activeColor: SColors.primary,
                  inactiveTrackColor:  SColors.grey,
                  title: const Text("Show my name on public reviews"),
                  secondary: const Icon(Icons.person_outline),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  value: personalizedRecommendations,
                  onChanged: (val) {
                    setState(() => personalizedRecommendations = val);
                  },activeColor: SColors.primary,
                  inactiveTrackColor:  SColors.grey,
                  title: const Text("Allow personalized recommendations"),
                  secondary: const Icon(Icons.recommend_outlined),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  value: pushNotifications,
                  onChanged: (val) {
                    setState(() => pushNotifications = val);
                  },activeColor: SColors.primary,
                  inactiveTrackColor:  SColors.grey,
                  title: const Text("Allow push notifications"),
                  secondary: const Icon(Icons.notifications_active_outlined),
                ),
                const Divider(height: 1),
                SwitchListTile(
                  value: twoStepVerification,
                  onChanged: (val) {
                    setState(() => twoStepVerification = val);
                  },activeColor: SColors.primary,
                  inactiveTrackColor:  SColors.darkGrey,
                  title: const Text("Enable 2-step verification"),
                  secondary: const Icon(Icons.verified_user_outlined),
                ),
              ],
            ),
          ),

          const SizedBox(height: SSizes.spaceBtwSections),

          // 🔐 Data & Security
          Text(
            'Data & Security',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: SSizes.spaceBtwItems),

          Card(
            color:  dark ? SColors.grey : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.lock_outline),
                  title: const Text("Change Password"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChangePasswordScreen()),
                    );
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.download_outlined),
                  title: const Text("Download My Data"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Download feature coming soon")),
                    );
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.delete_outline, color: Colors.red),
                  title: const Text(
                    "Delete My Account",
                    style: TextStyle(color: Colors.red),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      size: 18, color: Colors.red),
                  onTap: () => _confirmDeleteAccount(context, dark),
                ),
              ],
            ),
          ),

          const SizedBox(height: SSizes.spaceBtwSections),

          // 📜 Policy Links
          Text(
            'Legal',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: SSizes.spaceBtwItems),
          Card(
            color: dark ? SColors.grey : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.privacy_tip_outlined),
                  title: const Text("Privacy Policy"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PrivacyPolicyScreen()),);
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.article_outlined),
                  title: const Text("Terms & Conditions"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TermsAndConditionsScreen()),);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteAccount(BuildContext context, bool dark) {
    showDialog(

      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: dark ? SColors.dark : SColors.light,
        title: const Text('Delete Account'),
        content: const Text(
            'Are you sure you want to delete your account? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Your account deletion request is received.')),
              );
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
