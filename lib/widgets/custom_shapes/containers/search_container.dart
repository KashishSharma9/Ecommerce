import 'package:flutter/material.dart';

import '../../../ utils/constants/colors.dart';
import '../../../ utils/constants/sizes.dart';
import '../../../ utils/device_utility.dart';
import '../../../helpers/helper_function.dart';
class SSearchContainer extends StatelessWidget {
  const SSearchContainer({
    super.key, required this.text, this.icon,  this.showBackground = true,  this.showBorder= true,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;



  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:SSizes.defaultSpace),
      child: Container(
        width: SDeviceUtils.getScreenWidth(context),
        padding: EdgeInsets.all(SSizes.md),
        decoration: BoxDecoration(
            color: showBackground ? dark ? SColors.dark : SColors.light : Colors. transparent,
            borderRadius: BorderRadius.circular(SSizes.cardRadiusLg),
            border: showBorder? Border.all(color:SColors.white) : null
        ),
        child: Row(
          children: [
            Icon(icon,color: SColors.darkGrey,),
            SizedBox(width: SSizes.spaceBtwItems,),
            Text(text, style: Theme.of(context).textTheme.bodySmall),

          ],
        ),
      ),
    );
  }
}