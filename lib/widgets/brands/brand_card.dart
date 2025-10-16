import 'dart:math' as MalnAxissize;

import 'package:ecommereceapp/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter/material.dart';

import '../../ utils/constants/image_strings.dart';
import '../../ utils/constants/sizes.dart';
import '../../helpers/helper_function.dart';
import 'brand_title_with_verfied_icon.dart';
import 'circular_image.dart';

class SBrandCard extends StatelessWidget {
  const SBrandCard({
    super.key,
    this.onTap,
    required this. showBorder,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = SHelperFunctions.isDarkMode(context);
    return  GestureDetector(
        onTap: onTap,
      // Container Design
      child: SRoundedContainer(
      showBorder: showBorder,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(SSizes.Sm),
      child: Row(
      crossAxisAlignment:CrossAxisAlignment.center,
      children: [
        //Icon
      Flexible(
      child: SCircularImage(
      isNetworkImage: false,
        image: SImages.clothIcon,
        backgroundColor:  Colors.transparent,
        overlayColor: isDark? Colors.white: Colors. black,
          width: 50, height: 50, padding: 0


      ),
      ),
        const SizedBox(width: SSizes.spaceBtwItems /2),

        //texts
        Expanded(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
        SBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.large),
        Text(
            '25 Products',
            overflow: TextOverflow.ellipsis,
            style:Theme.of(context).textTheme.labelMedium
        )

      ]
        ),
        )
        ]
    ),
    ),
    );
  }
}
