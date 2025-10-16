import 'package:flutter/material.dart';

import '../../ utils/constants/colors.dart';
import '../../ utils/constants/image_strings.dart';
import '../brands/circular_image.dart';

class SUserProfileTile extends StatelessWidget {


  const SUserProfileTile({
    super.key, required this.onPressed,

  });
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: SCircularImage(
        image: SImages.user,
        width: 50, height: 50, padding: 0,),
      title: Text( 'Kashish', style: Theme. of (context). textTheme.headlineSmall!.apply(color: SColors.white)),
      subtitle: Text( 'support@mail.com', style: Theme. of (context). textTheme.bodyMedium!.apply(color: SColors.white)),
      trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.edit, color: SColors.white),),
    );
  }
}
