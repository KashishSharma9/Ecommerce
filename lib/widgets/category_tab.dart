import 'package:ecommereceapp/widgets/layouts/grid_layout.dart';
import 'package:ecommereceapp/widgets/products_cart/product_cart_vertical.dart';
import 'package:ecommereceapp/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../ utils/constants/image_strings.dart';
import '../ utils/constants/sizes.dart';
import 'brands/brand_show_case.dart';

class SCategoryTab extends StatelessWidget {
  const SCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children:[
        Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            children: [
              //brands
              const SBrandShowCase(images: [SImages.producutImage1, SImages.producutImage2, SImages.producutImage3,],),
              SizedBox(height: SSizes.spaceBtwItems,),
              //products
              SSectionHeading( title: 'You might like', showactionButton: true, onPressed: () {}),
              SizedBox(height: SSizes.spaceBtwItems,),

              SGridLayout(itemCount: 4, itemBuilder: (_, index) => SProductCartVertical())
            ],
          ),
      ),
    ]
    );
        }
}
