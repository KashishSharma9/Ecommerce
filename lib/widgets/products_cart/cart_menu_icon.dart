import 'package:flutter/material.dart';

import '../../ utils/constants/colors.dart';

class SCartCounterIcon extends StatelessWidget {
  const SCartCounterIcon({
    super.key,
    required this.OnPressed,
    required this.iconColor  ,
  });
  final VoidCallback OnPressed;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior:Clip.none,
        children:[ IconButton(onPressed: OnPressed, icon: Icon(Icons.shopping_bag, color: iconColor,)
    ),
      Positioned(
        right: 1,
        child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
              color: SColors.black,
              borderRadius: BorderRadius.circular(100)
          ),
          child: Center(
            child: Text('2',style: Theme.of(context).textTheme.labelLarge!.apply(color: SColors.white, fontSizeFactor: 0.8),),
          ),
        ),
      )
    ]
    );
  }
}