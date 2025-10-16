import 'package:ecommereceapp/screens/home/home_screen.dart';
import 'package:ecommereceapp/screens/settings/settings.dart';
import 'package:ecommereceapp/screens/store/store.dart';
import 'package:ecommereceapp/screens/wishlist/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import ' utils/constants/colors.dart';
import 'helpers/helper_function.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = SHelperFunctions. isDarkMode(context) ;
    return Scaffold(
      bottomNavigationBar: Consumer<NavigationController>(
        builder: (context, controller, _) {
          return NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex,
            onDestinationSelected: (index) => controller.updateIndex(index),
              backgroundColor: darkMode ? SColors.black: Colors.white,
              indicatorColor: darkMode ? SColors.white.withOpacity(0.1) : Colors.black. withOpacity(0.1),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon( Icons.storefront_outlined),
                label: 'Store',
              ),
              NavigationDestination(
                icon: Icon(CupertinoIcons.heart),
                label: 'Wishlist',
              ),
              NavigationDestination(
                icon: Icon(CupertinoIcons.person),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
      body: Consumer<NavigationController>(
        builder: (context, controller, _) {
          return controller.screens[controller.selectedIndex];
        },
      ),
    );
  }
}

class NavigationController extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  final List<Widget> screens = [
    HomeScreen(),
    StoreScreen(),
    FavouriteScreen(),
    SettingsScreen(),
  ];

  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
