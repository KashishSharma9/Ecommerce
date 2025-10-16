import 'package:ecommereceapp/%20utils/constants/sizes.dart';
import 'package:ecommereceapp/helpers/helper_function.dart';
import 'package:ecommereceapp/widgets/products_cart/product_meta_data.dart';
import 'package:ecommereceapp/widgets/s_rounded_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ utils/constants/colors.dart';
import '../../ utils/constants/image_strings.dart';
import '../../providers/navigation_provider.dart';
import '../../widgets/appbar/appbar.dart';

import '../../widgets/icons/circular_icon.dart';
class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: SAppBar(
        showbackarrow: true,
        backgroundColor: Colors.transparent,
        actions: [Padding(
          padding: const EdgeInsets.only(right: 10),
          child: SCircularIcon(icon: CupertinoIcons.heart_fill, color: Colors.red),),
        ],
      ),
        body: SingleChildScrollView(
          child: Column(
              children: [
                //  Product Image Header (Curved)
                  Container(
                     color: dark ? SColors.dark : SColors.light,
                     padding: const EdgeInsets.only(bottom: SSizes.spaceBtwSections),
                     child: Stack(
                       children: [
                         //main large image
                     SizedBox(height: 400,child: Padding(
                       padding: const EdgeInsets.all(SSizes.productImageRadius *4 ),
                       child: Center(child: Image (image: AssetImage(SImages.producutImage4))),
                     )
                     ),
                         //Image Slider
                         Positioned(
                           bottom: 20,
                           left: 0,
                           right: 0,
                           child: Container(
                             height: 80,
                             padding: const EdgeInsets.symmetric(horizontal: SSizes.defaultSpace),
                             child: ListView.separated(
                               scrollDirection: Axis.horizontal,
                               itemCount: 6,
                               separatorBuilder: (_, __) => const SizedBox(width: SSizes.spaceBtwItems),
                               itemBuilder: (_, index) => AnimatedContainer(
                                 duration: const Duration(milliseconds: 200),
                                 decoration: BoxDecoration(
                                   color: dark ? SColors.dark : Colors.white,
                                   borderRadius: BorderRadius.circular(16),
                                   border: Border.all(
                                     color: dark? SColors.white: SColors.black,
                                   ),
                                 ),
                                 padding: const EdgeInsets.all(8),
                                 child: SRoundedImage(
                                   width: 60,
                                   height: 60,
                                   borderRadius: 9,
                                   imageurl: SImages.producutImage4,
                                 ),
                               ),
                             ),
                           ),
                         ),
                       ],
                     ),


                  ),

    // Product Details
            Padding(
            padding: EdgeInsets. only(right: SSizes.defaultSpace, left: SSizes.defaultSpace, bottom: SSizes.defaultSpace),
                child: Column (
               children: [
                // - Rating & Share Button
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
    // Rating
                 Row(
                children: [
                    Icon(CupertinoIcons.star_fill, color: Colors.amber, size: 24),
                   SizedBox(width: SSizes.spaceBtwItems / 2),
                 Text.rich(
                   TextSpan(
                     children:[
                       TextSpan(text:'5.0' ,style: Theme.of(context). textTheme.bodyLarge),
                       const TextSpan (text: ' (299)'),
                   ]
                       )
                   )
                ]
                 ),
                //Share Button
                IconButton(onPressed: () {}, icon: const Icon(Icons.share, size: SSizes.md) ,)
]
      ),
              /// - Price, Title, Stock, & Brand
                 SProductMetaData(),
                /// -- Attributes
                /// -- Checkout Button
                 SizedBox(height: SSizes.spaceBtwSections),

                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){context.read<NavigationProvider>().goToLoginScreen(context);}, child: Text ('CheckOut'),)),
                      SizedBox(height: SSizes.spaceBtwSections),
                /// - Description
                /// - Reviews
          ]
        ),
            )
            ]
        )
        )
    );
  }
}
