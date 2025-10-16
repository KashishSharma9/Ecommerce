import 'package:ecommereceapp/%20utils/constants/image_strings.dart';
import 'package:ecommereceapp/widgets/products_cart/product_price_text.dart';
import 'package:flutter/material.dart';

import '../../ utils/constants/colors.dart';
import '../../ utils/constants/sizes.dart';
import '../../helpers/helper_function.dart';
import '../brands/brand_title_with_verfied_icon.dart';
import '../brands/circular_image.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../product_title_text.dart';

class SProductMetaData extends StatelessWidget {
  SProductMetaData({super.key,});

  @override
  Widget build(BuildContext context) {
    final darkMode = SHelperFunctions.isDarkMode(context);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Price & Sale Price
          Row(
              children: [

                /// Sale Tag
                SRoundedContainer(radius: SSizes.Sm,
                  backgroundColor: SColors.secondary.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: SSizes.Sm, vertical: SSizes.XS),
                  child: Text('25%', style: Theme
                      .of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: SColors.black)),
                ),
                const SizedBox(width: SSizes.spaceBtwItems),

                /// Price
                Text('450.00', style: Theme.of(context). textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                const SizedBox(width: SSizes.spaceBtwItems),
                const SProductPriceText(price: '399.00', isLarge: true,),
              ]
          ),
                const SizedBox(height: SSizes.spaceBtwItems / 1.5),


          /// Title
           const SProductTitleText(title: 'Green Nike Sports Shirt'),

             const SizedBox(height: SSizes.spaceBtwItems / 1.5),
               /// Stock Status
                 Row(
                   children: [
                     const SProductTitleText(title: 'Status'),
                     Text( 'In Stock', style: Theme.of(context). textTheme. titleMedium),
                   ],
                 ),
              const SizedBox(height: SSizes.spaceBtwItems / 1.5),
          /// Brand
          Row(
            children: [
          SCircularImage (image:SImages.shoeicon, width:32 , height: 32, padding:0,overlayColor: darkMode? SColors.white : SColors.black ,),
              const SBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.medium),
            ],
          ),
        ]
    );
  }
}