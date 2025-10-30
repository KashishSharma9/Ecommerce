import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ utils/constants/colors.dart';
import '../../ utils/constants/image_strings.dart';
import '../brands/circular_image.dart';
import '../../screens/profile/edit_profile_screen.dart';
import '../../providers/auth_provider.dart';

class SUserProfileTile extends StatelessWidget {
  const SUserProfileTile({super.key, required this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;
    return ListTile(
      onTap: onPressed,
      leading: SCircularImage(
        image: SImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        user?.name ?? 'Kashish',
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.apply(color: SColors.white),
      ),
      subtitle: Text(
        user?.email ?? 'support@mail.com',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.apply(color: SColors.white),
      ),
      trailing: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const EditProfileScreen()),
          );
        },
        icon: const Icon(Icons.edit, color: SColors.white),
      ),
    );
  }
}
