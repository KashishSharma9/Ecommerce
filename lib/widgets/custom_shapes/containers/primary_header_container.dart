import 'package:flutter/material.dart';

import '../../../ utils/constants/colors.dart';
import 'circular_container.dart';
class SPrimaryHeaderContainer extends StatelessWidget {
  const SPrimaryHeaderContainer({
    super.key, required this.child, required this.size,
  });
  final Widget child;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: SColors.primary,
      padding: EdgeInsets.all(0),
      child: SizedBox(
        height: size,
        child: Stack(
          children: [
            Positioned(top:-150, right: -250, child:  SCircularContainer(backgroundColor: SColors.textWhite.withOpacity(0.1),)),
            Positioned(top:100, right : -300 , child: SCircularContainer(backgroundColor: SColors.textWhite.withOpacity(0.1),)),
            child,
          ],
        ),
      ),
    );
  }
}