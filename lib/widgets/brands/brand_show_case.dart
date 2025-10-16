import 'package:flutter/material.dart';

import '../../ utils/constants/colors.dart';
import '../../ utils/constants/image_strings.dart';
import '../../ utils/constants/sizes.dart';
import '../../helpers/helper_function.dart';
import 'brand_card.dart';
import '../custom_shapes/containers/rounded_container.dart';
class SBrandShowCase extends StatelessWidget {
  const SBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SRoundedContainer(
        showBorder: true,
        borderColor: SColors.darkGrey,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only (bottom: SSizes.spaceBtwItems),
        padding: EdgeInsets.all(SSizes.md),
        child: Column(
            children: [
              //Brands with product count
              const SBrandCard(showBorder: false),
              SizedBox(height: SSizes.spaceBtwItems,),
              //brands top 3 product images
              Row(
                  children: images.map((image) =>
                      brandTopProductImageWidget(image, context)).toList()),
            ]
        )
    );
  }


  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(child: SRoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(SSizes.md),
      margin: const EdgeInsets.only(right: SSizes.Sm),
      backgroundColor: SHelperFunctions.isDarkMode(context)
          ? SColors.darkerGrey
          : SColors.light,
      child:  Image(
        fit: BoxFit.contain, image: AssetImage(image),),
    ),
    );
  }
}
