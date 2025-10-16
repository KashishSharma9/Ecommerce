import 'package:flutter/material.dart';

import '../../ utils/constants/colors.dart';
import '../../ utils/device_utility.dart';
import '../../helpers/helper_function.dart';

class STabbar extends StatelessWidget implements PreferredSizeWidget {
  const STabbar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? Colors.black : Colors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: SColors.primary,
        labelColor: dark ? Colors.white : SColors.primary,
        unselectedLabelColor: SColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SDeviceUtils.getAppBarHeight());
}
