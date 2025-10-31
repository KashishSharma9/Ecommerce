import 'package:ecommereceapp/%20utils/constants/colors.dart';
import 'package:ecommereceapp/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ utils/constants/sizes.dart';
class SCircularIcon extends StatelessWidget {
  const SCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = SSizes.lg,
    this.color,
    this.backgroundColor, this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container (
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius. circular (100),
          color: backgroundColor != null
              ? backgroundColor!
          : SHelperFunctions.isDarkMode(context)
            ?SColors.black.withOpacity(0.9)
              :SColors.white.withOpacity(0.9),

        ),
        child: IconButton(onPressed:onPressed ,icon: Icon(icon, color: color,)),
      ),
    );
  }
}
