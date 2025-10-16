import 'package:ecommereceapp/%20utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../ utils/constants/colors.dart';
import '../brands/brand_title_with_verfied_icon.dart';
import 'brand_title_text.dart';

class SBrandTitleWithVerifiedIcon extends StatelessWidget {
  const SBrandTitleWithVerifiedIcon({super.key,
  this. textcolor,
  this.maxLines = 1,
  required this. title,
  this.iconcolor = SColors.primary,
  this.textAlign = TextAlign.center,
  this. brandTextSize = TextSizes. small,
});

  final String title;
  final int maxLines;
  final Color? textcolor, iconcolor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build (BuildContext context) {
  return Row(
  mainAxisSize: MainAxisSize.min,
  children: [
  Flexible(
  child:SBrandTitleText(
  title: title,
  color: textcolor,
  maxLines: maxLines,
  textAlign: textAlign,
  brandTextSize: brandTextSize,
  ),
    ),
    SizedBox(width: SSizes.XS,),
    Icon(Icons.verified, color: iconcolor,size: SSizes.iconXs,),
    ]
  );
  }
}