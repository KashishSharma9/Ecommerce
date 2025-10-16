import 'package:flutter/material.dart';

import '../../ utils/constants/colors.dart';
import '../../ utils/constants/sizes.dart';
import '../../helpers/helper_function.dart';
class SVerticalImageText extends StatelessWidget {
  const SVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = SColors.white,
    this.backgroundColor= SColors.white,
    this.onTap,
  });
  final String image, title; final Color textColor;
  final Color? backgroundColor; final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right:SSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
                width: 70,
                height: 70,
                padding: EdgeInsets.all(SSizes.Sm),
                decoration: BoxDecoration(
                  color: backgroundColor?? (SHelperFunctions.isDarkMode(context) ? SColors.black: SColors.white),
                  borderRadius: BorderRadius. circular (100),
                ),
                child: Center(
                  child: Image(image: AssetImage(image),fit: BoxFit.cover, ),)
            ),
            SizedBox(height: SSizes.spaceBtwItems/2,),
            SizedBox(width:55 ,child: Text( title , style: Theme.of(context).textTheme. labelMedium!.apply(color: textColor),
              maxLines: 1, overflow: TextOverflow.ellipsis,
            )),
          ],
        ),
      ),
    );
  }
}