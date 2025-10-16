import 'package:flutter/material.dart';

import '../ utils/constants/colors.dart';

/// A simple reusable curved header widget
class SCustomCurvedEdges extends StatelessWidget {
  final double height;
  final Color color;

  const SCustomCurvedEdges({
    super.key,
    this.height = 250,
    this.color = SColors.primary, required Container child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _CurvedClipper(),
      child: Container(
        height: height,
        width: double.infinity,
        color: color,
      ),
    );
  }
}

/// This clipper creates a smooth curved bottom edge
class _CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 60,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
