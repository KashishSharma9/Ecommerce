import 'package:flutter/material.dart';

enum TextSizes { small, medium, large }

class SBrandTitleWithVerifiedIcon extends StatelessWidget {
  final String title;
  final TextSizes brandTextSize;
  final bool showVerifiedIcon;
  final Color? textColor;

  const SBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.brandTextSize = TextSizes.medium,
    this.showVerifiedIcon = true,
    this.textColor,
  });

  double _getFontSize() {
    switch (brandTextSize) {
      case TextSizes.small:
        return 12.0;
      case TextSizes.large:
        return 18.0;
      default:
        return 14.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = textColor ?? Theme.of(context).textTheme.titleMedium!.color;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: _getFontSize(),
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
        if (showVerifiedIcon) ...[
          const SizedBox(width: 4),
          Icon(
            Icons.verified,
            size: 16,
            color: Colors.blueAccent,
          ),
        ],
      ],
    );
  }
}
