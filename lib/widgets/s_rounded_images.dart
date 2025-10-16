import 'package:flutter/material.dart';

import '../ utils/constants/colors.dart';
import '../ utils/constants/sizes.dart';
class SRoundedImage extends StatelessWidget {
  const SRoundedImage({
    super.key,
    this. border,
    this.padding,
    this.onPressed,
    this.width = 150,
    this.height = 150,
    this.applyImageRadius = true,
    required this. imageurl,
    this.fit = BoxFit.contain,
    this.backgroundcolor = SColors.light,
    this.isNetworkImage = false,
    this.borderRadius = SSizes.md,
  });
  final double? width, height;
  final String imageurl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundcolor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: border,
          color: backgroundcolor,
          borderRadius: BorderRadius.circular(SSizes.md),),
        child: ClipRect(
          child: Image(fit: fit, image: isNetworkImage ? NetworkImage(imageurl) : AssetImage(imageurl) as ImageProvider),

        ),

      ),
    );
  }
}