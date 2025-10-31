import 'package:ecommereceapp/widgets/layouts/grid_layout.dart';
import 'package:ecommereceapp/widgets/products_cart/cart_menu_icon.dart';
import 'package:ecommereceapp/widgets/products_cart/product_cart_vertical.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ utils/constants/colors.dart';
import '../../ utils/constants/sizes.dart';
import '../../widgets/appbar/appbar.dart';
import '../../widgets/icons/circular_icon.dart';
import '../../providers/wishlist_provider.dart';
import '../cart/cart_screen.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WishlistProvider>(
      builder: (context, wishlistProvider, child) {
        final wishlistItems = wishlistProvider.wishlist;

        return Scaffold(
          appBar: SAppBar(
            title: Text(
              'Wishlist',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child:  SCartCounterIcon(() { Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen())); }, SColors.white)
              ),
            ],
            showbackarrow: false,
          ),
          body: wishlistItems.isEmpty
              ? const Center(
            child: Text(
              'No items in your wishlist yet ❤️',
              style: TextStyle(fontSize: 16),
            ),
          )
              : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(SSizes.defaultSpace),
              child: SGridLayout(
                itemCount: wishlistItems.length,
                itemBuilder: (_, index) => SProductCartVertical(),
              ),
            ),
          ),
        );
      },
    );
  }
}


