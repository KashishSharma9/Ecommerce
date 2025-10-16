import 'package:flutter/material.dart';
class SSectionHeading extends StatelessWidget {
  const SSectionHeading({
    super.key,
    this.textcolor,
    this.showactionButton= true,
    required this.title,
    this.buttonTitle = 'View All',
    this.onPressed,
  });
  final Color? textcolor;
  final bool showactionButton;
  final String title,buttonTitle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall!.apply(color: textcolor),maxLines: 1, overflow: TextOverflow.ellipsis),
        if(showactionButton)  TextButton(onPressed: (){}, child: Text(buttonTitle))
      ],
    );
  }
}