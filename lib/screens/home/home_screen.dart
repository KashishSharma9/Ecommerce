import 'package:ecommereceapp/%20utils/constants/sizes.dart';
import 'package:ecommereceapp/%20utils/constants/text_strings.dart';
import 'package:ecommereceapp/widgets/appbar/appbar.dart';
import 'package:ecommereceapp/widgets/products_cart/product_cart_vertical.dart';
import 'package:flutter/material.dart';
import '../../ utils/constants/colors.dart';
import '../../ utils/constants/image_strings.dart';
import '../../navigation_menu.dart';
import '../../widgets/custom_shapes/containers/primary_header_container.dart';
import '../../widgets/custom_shapes/containers/search_container.dart';
import '../../widgets/image_texts_widgets/vertical_image_text.dart';
import '../../widgets/layouts/grid_layout.dart';
import '../../widgets/products_cart/cart_menu_icon.dart';
import '../../widgets/promo_slider.dart';
import '../../widgets/s_rounded_images.dart';
import '../../widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {"image": "assets/images/sports.png", "title": "Sports"},
      {"image": "assets/images/electronics.png", "title": "Electronics"},
      {"image": "assets/images/jwellery.png", "title": "Jewellery"},
      {"image": "assets/images/Shoe.png", "title": "Shoes"},
      {"image": "assets/images/cosmetics.png", "title": "Cosmetics"},
      {"image": "assets/images/furniture.png", "title": "Furniture"},
      {"image": "assets/images/clothes.png", "title": "Fashion"},
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SPrimaryHeaderContainer(
              size: 400,
              child: Column(
                children: [
                   SAppBar(
                    title: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(STexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: SColors.white),),
                          Text(STexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: SColors.white),)
                        ],
                      ),
                    ),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: SCartCounterIcon(OnPressed: () {  }, iconColor: SColors.white,),
                          ),
                        ], showbackarrow: false,
                ),
                  SizedBox(height: SSizes.spaceBtwSections,),
                  SSearchContainer(text: 'Search in Store',
                  icon: Icons.search,),
                  SizedBox(height: SSizes.spaceBtwSections,),
                  Padding(padding: EdgeInsets.only(left: SSizes.defaultSpace,
                  ),
                  child: Column(
                    children: [
                      SSectionHeading(showactionButton: false, title: 'Popular Categories', textcolor: Colors.white, onPressed: (){},),
                      SizedBox(height: SSizes.spaceBtwItems,),
                      SizedBox(
                        height: 110,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: categories.length,
                            scrollDirection: Axis.horizontal ,
                            itemBuilder: (_, index){
                            final category = categories[index];
                            return SVerticalImageText(onTap: (){}, image: category["image"]!, title:category["title"]!,);
                            }),
                      )
                    ],
                  ),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(SSizes.defaultSpace),
              child: Column(
                children: [
                  SPromoSlider( items:  [
                      SRoundedImage(imageurl: SImages.promoBanner1),
                  SRoundedImage(imageurl: SImages.promoBanner2),
                  SRoundedImage(imageurl: SImages.promoBanner3),
                ],),
                  SizedBox(height: SSizes.spaceBtwSections,),
                  //products
                  SGridLayout(itemCount: 10, itemBuilder: (_ , index )=>  SProductCartVertical()),

                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}


















