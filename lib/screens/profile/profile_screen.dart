import 'package:ecommereceapp/widgets/appbar/appbar.dart';
import 'package:ecommereceapp/widgets/profile/profile_menu.dart';
import 'package:ecommereceapp/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ utils/constants/image_strings.dart';
import '../../ utils/constants/sizes.dart';
import '../../widgets/brands/circular_image.dart';
import '../../providers/auth_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;
    return Scaffold(
      appBar: const SAppBar(showbackarrow: true, title: Text('Profile')),
      //Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              // Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const SCircularImage(
                      image: SImages.user,
                      width: 80,
                      height: 80,
                      padding: 0,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),
              //details
              SizedBox(height: SSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: SSizes.spaceBtwItems),
              SSectionHeading(
                title: 'Profile Information',
                showactionButton: false,
              ),
              const SizedBox(height: SSizes.spaceBtwItems),

              SProfileMenu(
                onPressed: () {},
                title: 'Name',
                value: user?.name ?? 'Kashish',
              ),
              SProfileMenu(
                title: 'Username',
                value: user?.username ?? 'Kashish_',
                onPressed: () {},
              ),
              const SizedBox(height: SSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: SSizes.spaceBtwItems),
                  // Heading Personal Info
                  const SSectionHeading(title: 'Personal Information', showactionButton: false), const SizedBox(height: SSizes.spaceBtwItems),
                  SProfileMenu(title: 'User ID', value: '45689', onPressed: () {  }),
                  SProfileMenu (title: 'E-mail', value: 'support@123.com', onPressed: (){}),
                  SProfileMenu(title: 'Phone Number', value: '+92-317-8059528', onPressed: (){}),
                  SProfileMenu(title: 'Gender', value: 'Female', onPressed: () {  },),
                  SProfileMenu(title:   'Date of Birth', value: '10 Oct, 1994', onPressed: () {}),
                const Divider(),
                 SizedBox(height: SSizes.spaceBtwItems,),
                  Center (child: TextButton(onPressed: (){},
                      child: const Text('Close Account', style: TextStyle(color: Colors.red))
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
