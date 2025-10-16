import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommereceapp/providers/home_provider.dart';
import 'package:ecommereceapp/widgets/s_rounded_images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ utils/constants/colors.dart';
import '../ utils/constants/image_strings.dart';
import '../ utils/constants/sizes.dart';
import 'custom_shapes/containers/circular_container.dart';

class SPromoSlider extends StatelessWidget {
  const SPromoSlider({
    super.key, required List<String> images,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.read<HomeProvider>();
    return Column(
      mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Center(
            child: CarouselSlider(
                items: const [
            SRoundedImage(imageurl: SImages.promoBanner3,),
            SRoundedImage(imageurl: SImages.promoBanner3,),
            SRoundedImage(imageurl: SImages.promoBanner3,),
                    ],
                    options: CarouselOptions(
            height: 200,
                    viewportFraction: 0.7,
                enlargeCenterPage: true,
                onPageChanged: (index, _) {
                context.read<HomeProvider>().updatePageIndicator(index);
                },
                    )),
          ),
          SizedBox(height: SSizes.spaceBtwItems,),
            Consumer<HomeProvider>(
              builder: (context, controller, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for(int i = 0; i < 3; i++)
                 SCircularContainer(width: 20, height: 4,
                     backgroundColor: controller.carousalCurrentIndex== i
                         ? SColors.primary : SColors.grey
                   ),
               ],
            );
           }
           )
        ]
    );
  }
}
Widget _buildCarouselItem(String imageUrl) {
  return Center(
    child: Container(
      width: 300, // fixed width for all items
      alignment: Alignment.center,
      child: SRoundedImage(imageurl: imageUrl),
    ),
  );
}
