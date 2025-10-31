
import 'package:ecommereceapp/%20utils/constants/image_strings.dart';
import 'package:ecommereceapp/%20utils/constants/sizes.dart';
import 'package:ecommereceapp/helpers/helper_function.dart';
import 'package:ecommereceapp/widgets/s_rounded_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ utils/constants/colors.dart';
import '../../common/styles/shadows.dart';
import '../../models/product.dart';
import '../../providers/navigation_provider.dart';
import '../../providers/cart_provider.dart';
import '../../providers/product_provider.dart';
import '../../providers/wishlist_provider.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../icons/circular_icon.dart';

class SProductCartVertical extends StatelessWidget {

  const SProductCartVertical ({super.key});

  @override
  Widget build(BuildContext context) {
    final dark =SHelperFunctions.isDarkMode(context);
    return  GestureDetector(
      onTap: (){context.read<NavigationProvider>().goToProductDetail(context);},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
          boxShadow: [SShadowStyle.VerticalProductShadow],
          borderRadius: BorderRadius.circular(SSizes.productImageRadius),
          color: dark ? SColors.darkerGrey : SColors.white,
          ),
        child: Column(
          children: [
            SRoundedContainer(
              height: 200,
              padding: const EdgeInsets.all(SSizes.Sm),
              backgroundColor: dark? SColors.dark : SColors.light,
              child: Stack(
                children: [
                  //Thumbnail Image
                  SRoundedImage(imageurl: SImages.producutImage3, applyImageRadius: true,),
                  //Sale Tag
                  Positioned(
                    top: 12,
                    child: SRoundedContainer(
                      radius: SSizes.Sm,
                      backgroundColor: SColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric (horizontal: SSizes.Sm, vertical: SSizes.XS),
                        child: Text ("25%", style: Theme.of(context).textTheme. labelLarge!.apply(color: SColors.black)) ,
                    ),
                  ),
                  //fav. Icon button
                  // fav. Icon button
                  Positioned(
                    top: 9,
                    right: 12,
                    child: Consumer<WishlistProvider>(
                      builder: (context, wishlistProvider, child) {
                        // Example product — in your real list, use the actual product object
                        final product = Product(
                          id: '1',
                          title: 'Nike Air Shoes',
                          price: 2800, imageUrl: SImages.producutImage3,
                        );

                        final isInWishlist = wishlistProvider.isWishlisted(product);

                        return Positioned(
                          top: -1,
                          right:-2,
                          child: SCircularIcon(
                            icon: isInWishlist
                                ? CupertinoIcons.heart_fill
                                : CupertinoIcons.heart, // filled if in wishlist
                            color: isInWishlist ? Colors.red : Colors.grey,
                            onPressed: () {
                              wishlistProvider.toggleWishlist(product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(isInWishlist
                                      ? 'Removed from favorites ❤️‍🔥'
                                      : 'Added to favorites ❤️'),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

            ),
            //details
            Padding(padding: const EdgeInsets.only(left: SSizes.Sm)),
            Column(
              children: [
                Text('Nike Air Shoes',
                  style: Theme.of(context).textTheme.labelLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign:TextAlign.left,

                ),
                SizedBox(height: SSizes.spaceBtwItems/2,),
                Row(
                  children: [
                    Text('Nike', overflow: TextOverflow.ellipsis, maxLines: 1, style: Theme. of (context). textTheme.labelMedium,
                    textAlign: TextAlign.left,),
                    SizedBox(width: SSizes.XS,),
                    Icon (Icons.verified, color: SColors.primary ,size:SSizes.iconSm),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //price
                  Text(
                    '₹2800',
                        maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: SColors.dark,
                        borderRadius: BorderRadius.only(
                        topLeft: Radius. circular(SSizes.cardRadiusMd),
                          bottomRight: Radius. circular (SSizes.productImageRadius),
                  ),
                    ),
                    child: SizedBox(
                      width: SSizes.iconlg *1.2,
                        height: SSizes.iconlg *1.4,
                        child: Center(child: IconButton(
                          icon: const Icon(Icons.add, color: Colors.white),
                          onPressed: () {
                            // Add to cart functionality
                            final cartProvider = Provider.of<CartProvider>(context, listen: false);
                            final productProvider = Provider.of<ProductProvider>(context, listen: false);
                            // Assuming we add the first product for now, since widget is hardcoded
                            final product = productProvider.products.firstWhere((p) => p.title == 'Nike Air Shoes');
                            cartProvider.addItem(product);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Added to cart')),
                            );
                          },
                        ))),
                  )
                ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}









