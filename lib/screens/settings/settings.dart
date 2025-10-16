import 'package:ecommereceapp/%20utils/constants/sizes.dart';
import 'package:ecommereceapp/widgets/appbar/appbar.dart';
import 'package:ecommereceapp/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';
import '../../ utils/constants/colors.dart';
import '../../widgets/custom_shapes/containers/primary_header_container.dart';
import '../../widgets/list_tiles/settings_menu_tile.dart';
import '../../widgets/list_tiles/user_profile_tiles.dart';
import '../profile/profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:  Column(
           children:[
           //Header
              SPrimaryHeaderContainer(
                size: 300,
                child: Column(
                  children: [
                    //Appbar
                    SAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: SColors.white)), showbackarrow: false,),
                    SizedBox(height: SSizes.spaceBtwSections,),
                    //user profile card
                    SUserProfileTile(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    },),
                    SizedBox(height: SSizes.spaceBtwSections,)
                  ]
                )
              ),
             //body
             Padding(
             padding: EdgeInsets.all(SSizes.defaultSpace),
             child: Column ( children: [
             //Account Settings
             SSectionHeading (title: 'Account Settings', showactionButton: false,),
               SizedBox(height: SSizes.spaceBtwItems,),

               SSettingsMenuTile(icon: Icons.home_filled, title: 'My Addresses', subTitle:'Set shopping delivery address', onTap:(){}),
               SSettingsMenuTile(icon: Icons.shopping_cart_outlined, title: 'My Cart', subTitle: 'Add, remove products and move to checkout'),
               SSettingsMenuTile(icon: Icons.shopping_bag_outlined, title: 'My Orders', subTitle: 'In-progress and Completed Orders'),
               SSettingsMenuTile(icon: Icons.monetization_on_outlined, title: 'Bank Account',subTitle: 'Withdraw balance to registered bank account'),
               SSettingsMenuTile(icon: Icons.discount_outlined, title: 'My Coupons', subTitle: 'List of all the discounted coupons'),
               SSettingsMenuTile(icon: Icons.notifications_active_outlined, title: 'Notifications', subTitle: 'Set any kind of notification message'),
               SSettingsMenuTile(icon: Icons.security_outlined, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts'),

               // App Settings
               SizedBox(height: SSizes.spaceBtwSections),
               SSectionHeading(title: 'App Settings', showactionButton: false),
               SizedBox(height: SSizes.spaceBtwItems),
               SSettingsMenuTile(icon: Icons.document_scanner_outlined, title: 'Load Data', subTitle: 'Upload Data to your Cloud Firebase'),
               SSettingsMenuTile(icon: Icons.location_on, title: 'Geolocation', subTitle:'Set recommendation based on location',
               trailing:Switch(value: true, onChanged: (value) {},),
    ),
               SSettingsMenuTile(icon: Icons.verified_user, title:'Safe Mode',subTitle: 'Search result is safe for all ages'
    , trailing: Switch(value: false,onChanged: (value) {},),
    ),
    SSettingsMenuTile(
    icon: Icons.image, title: 'HD Image Quality', subTitle:'Set image quality to be seen',
    trailing: Switch(value: false, onChanged: (value) {}),
    ),
               //Logout Button
               const SizedBox(height: SSizes.spaceBtwSections),
               SizedBox(width: double.infinity,
               child: OutlinedButton(onPressed: (){} , child: const Text( 'Logout')),
               ),
               const SizedBox(height: SSizes.spaceBtwSections * 2.5),
        ]
    )
             )
                ]
            )
        )
    );
  }
}


