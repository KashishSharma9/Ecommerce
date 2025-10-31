import 'package:ecommereceapp/%20utils/constants/image_strings.dart';
import 'package:ecommereceapp/widgets/appbar/appbar.dart';
import 'package:ecommereceapp/widgets/appbar/tabbar.dart';
import 'package:ecommereceapp/widgets/brands/brand_card.dart';
import 'package:ecommereceapp/widgets/brands/brand_show_case.dart';
import 'package:ecommereceapp/widgets/category_tab.dart';
import 'package:ecommereceapp/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommereceapp/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommereceapp/widgets/layouts/grid_layout.dart';
import 'package:ecommereceapp/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';
import '../cart/cart_screen.dart';

import '../../ utils/constants/colors.dart';
import '../../ utils/constants/sizes.dart';
import '../../helpers/helper_function.dart';
import '../../widgets/products_cart/cart_menu_icon.dart';
import '../../widgets/promo_slider.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: SAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SCartCounterIcon(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartScreen()),
                );
              }, dark ? Colors.white : Colors.black),
            ),
          ],
          showbackarrow: false,
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: 440,
                automaticallyImplyLeading: false,
                backgroundColor: SHelperFunctions.isDarkMode(context)
                    ? SColors.black
                    : SColors.white,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(SSizes.defaultSpace),
                  child: ListView(
                    children: [
                      //search bar
                      SizedBox(height: SSizes.spaceBtwItems),
                      const SSearchContainer(
                        icon: Icons.search,
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: true,
                      ),
                      SizedBox(height: SSizes.spaceBtwItems),
                      const SizedBox(height: SSizes.spaceBtwItems / 1.5),

                      Column(
                        children: [
                          //featured brands
                          SPromoSlider(items: [SBrandCard(showBorder:true)],
                          ),
                          SizedBox(height: SSizes.spaceBtwSections,),

                        ],
                      ),

                      SizedBox(height: SSizes.spaceBtwItems),

                    ],
                  ),
                ),
                //tabs
                bottom: STabbar(
                  tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Cosmetics')),
                    Tab(child: Text('Clothes')),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              SCategoryTab(),
              SCategoryTab(),
              SCategoryTab(),
              SCategoryTab(),
              SCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
