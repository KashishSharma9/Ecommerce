import 'package:ecommereceapp/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommereceapp/widgets/products_cart/product_price_text.dart';
import 'package:flutter/material.dart';

import '../../ utils/constants/colors.dart';
import '../../ utils/constants/sizes.dart';
import '../../helpers/helper_function.dart';
import '../product_title_text.dart';
import '../texts/section_heading.dart';

class SProductAttributes extends StatelessWidget{
 SProductAttributes({super.key});
@override
Widget build(BuildContext context) {
final dark = SHelperFunctions.isDarkMode(context);

return Column(
children: [
/// -- Selected Attribute Pricing & Description
SRoundedContainer(
backgroundColor: dark ? SColors.darkerGrey : SColors.grey,
    child:  Column ( children: [
    /// Title, Price and Stock Staus
    Row(
    children: [
    SSectionHeading(title:
    'Variation',
        showactionButton: false),
    SizedBox(width: SSizes.spaceBtwItems),
    /// Actual Price
        Row(
          children: [
            Text(
                   ' 25',
                  style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            const SizedBox(width: SSizes.spaceBtwItems),
            const SProductPriceText(price:
            '20 '),
          ],
        ),
      //STOCK
    Row(
children: [
const SProductTitleText(title: 'Stock: ', smallSize: true),
   Text('In Stock', style: Theme.of(context) .textTheme.titleMedium),
  ]
  ),

    ]
),

  ]
    )
),
  ]
);
}
}