import 'package:ecommereceapp/%20utils/constants/image_strings.dart';
import 'package:ecommereceapp/%20utils/constants/sizes.dart';
import 'package:ecommereceapp/helpers/helper_function.dart';
import 'package:ecommereceapp/widgets/s_rounded_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ utils/constants/colors.dart';
import '../../common/styles/shadows.dart';
import '../../providers/navigation_provider.dart';
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
              Positioned(
                top: 0,
                  right:0,
                  child: SCircularIcon(icon: CupertinoIcons.heart_fill, color:Colors.red)),
      
      
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
                    '\$35.5',
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
                        child: Center(child: const Icon(Icons.add, color: Colors.white))),
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









