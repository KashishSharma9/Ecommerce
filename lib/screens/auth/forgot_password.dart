import 'package:ecommereceapp/%20utils/constants/text_strings.dart';
import 'package:ecommereceapp/screens/auth/reset_password.dart';
import 'package:flutter/material.dart';

import '../../ utils/constants/sizes.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword ({super.key});
  @override
  Widget build(BuildContext context) {
  return Scaffold(
   appBar: AppBar(),
   body: Padding(
  padding: EdgeInsets.all(SSizes.defaultSpace),
   child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
       children:  [
         //headings
         Text(STexts.forgotPasswordTitle,style: Theme.of(context).textTheme.headlineMedium),
         SizedBox(height: SSizes.spaceBtwItems,),
         Text(STexts.forgetPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium),
         SizedBox(height: SSizes.spaceBtwSections*2,),

         //Textfield

         TextFormField(
           decoration: InputDecoration(
             labelText: STexts.email , prefixIcon: Icon(Icons.email_outlined),
           ),

         ),
         SizedBox(height: SSizes.spaceBtwSections,),

         //button

         SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: (_) => ResetPassword()),);
         }, child: Text(STexts.submit)))

   ]
    ),
   )
   );
  }
}

