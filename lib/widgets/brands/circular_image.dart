import 'package:flutter/material.dart';

class SCircularImage extends StatelessWidget {
  final String image;
  final bool isNetworkImage;
  final double size;
  final Color backgroundColor;
  final Color overlayColor;

  const SCircularImage({
    super.key,
    required this.image,
    this.isNetworkImage = false,
    this.size = 56,
    this.backgroundColor = Colors.transparent,
    this.overlayColor = Colors.black, required int width, required int height, required int padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: isNetworkImage
              ? NetworkImage(image)
              : AssetImage(image) as ImageProvider,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            overlayColor.withOpacity(0.1),
            BlendMode.srcATop,
          ),
        ),
      ),
    );
  }
}
