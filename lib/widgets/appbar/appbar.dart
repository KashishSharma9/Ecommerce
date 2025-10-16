import 'package:flutter/material.dart';
import '../../ utils/constants/colors.dart';
import '../../ utils/device_utility.dart';

class SAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SAppBar({
    super.key,
    this.title,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
    required this. showbackarrow ,
    this.backgroundColor,
    this.transparent = false,
  });

  final Widget? title;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final bool showbackarrow;
  final Color? backgroundColor;
  final bool transparent;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 0),
      child: AppBar(
        backgroundColor: transparent ? Colors.transparent : Theme.of(context).appBarTheme.backgroundColor,
        automaticallyImplyLeading: false,
        leading: showbackarrow
            ? IconButton(
          icon: Icon(
            leadingIcon ?? Icons.arrow_back,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : SColors.black,
          ),
          onPressed: leadingOnPressed ?? () => Navigator.pop(context),
        )
            : null,
        title: title,
        actions: actions,

      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(SDeviceUtils.getAppBarHeight());
}
