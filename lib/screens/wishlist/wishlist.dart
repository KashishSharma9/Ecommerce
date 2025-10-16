import 'package:ecommereceapp/widgets/layouts/grid_layout.dart';
import 'package:ecommereceapp/widgets/products_cart/product_cart_vertical.dart';
import 'package:flutter/material.dart';

import '../../ utils/constants/sizes.dart';
import '../../widgets/appbar/appbar.dart';
import '../../widgets/icons/circular_icon.dart';
import '../home/home_screen.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SCircularIcon(
              icon:Icons.add,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
          ),
        ], showbackarrow: false,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(SSizes.defaultSpace),
            child: Column(
            children: [
              SGridLayout(itemCount: 6, itemBuilder: (_, index) => const SProductCartVertical())

          ],
        ),
        ),
      ),
    );
  }
}

