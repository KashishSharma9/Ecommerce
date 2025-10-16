import 'package:ecommereceapp/%20utils/constants/image_strings.dart';
import 'package:ecommereceapp/%20utils/constants/sizes.dart';
import 'package:ecommereceapp/%20utils/constants/text_strings.dart';
import 'package:ecommereceapp/%20utils/custom_themes/text_theme.dart';
import 'package:ecommereceapp/screens/auth/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ utils/constants/colors.dart';
import '../../helpers/helper_function.dart';
import '../../navigation_menu.dart';
import '../../providers/auth_provider.dart';
import '../home/home_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    if (authProvider.isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context) ;
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding:  EdgeInsets.only(top: SSizes.appBarHeight,
          bottom: SSizes.defaultSpace,
          left: SSizes.defaultSpace,
          right: SSizes.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(height: 150,
                  image: AssetImage(dark ? SImages.darkAppLogo: SImages.lightAppLogo),
                  ),
              Text(STexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium,),
              SizedBox(height: SSizes.Sm ,),
              Text(STexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium,)
                  ]
              ),
              //form
              Padding(
                padding: const EdgeInsets.symmetric(vertical: SSizes.spaceBtwSections),
                child: Form(child: Column(
                  children: [
                    //Email
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                         prefixIcon: Icon(Icons.email_outlined),
                        labelText: STexts.email
                      ),
                    ),
                    SizedBox(height: SSizes.spaceBtwInputFields,),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          labelText: STexts.password,
                        suffixIcon: Icon(Icons.remove_red_eye_rounded)
                      ),
                    ),
                    SizedBox(height: SSizes.spaceBtwInputFields /2,),

                    //remember me& forgot password
                    Row(
                      children: [
                        //remember me
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Checkbox(value: true, onChanged: (value){}),
                            const  Text(STexts.rememberMe),
                          ],
                        ),
                        SizedBox(width: 120,),
                        //forgot password
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_) => ForgetPassword()),);

                        }, child: const Text(STexts.forgetPassword))
                      ],
                    ),
                    SizedBox(height: SSizes.spaceBtwSections),

                    //Sign IN Button

                    SizedBox(width:double.infinity, child: ElevatedButton(onPressed: (){Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const NavigationMenu()),
                    );}, child: Text(STexts.signIn))),
                    SizedBox(height: SSizes.spaceBtwItems,),
                    //Create Account Button
                    SizedBox(width:double.infinity, child: OutlinedButton(onPressed: (){     Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupScreen()),);}, child: Text(STexts.createAccount))),
                    SizedBox(height: SSizes.spaceBtwItems,),
                    SizedBox(width:double.infinity, child: OutlinedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const HomeScreen()),);},
                        child: Text(STexts.skipLoginIn))),
                  ],
                )
                ),
              ),

              //Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center, children: [
                Flexible(child: Divider (color: dark ? SColors.darkGrey: Colors. grey, thickness: 0.5, indent: 60, endIndent: 5,)),
                Text(STexts.orSignInWith, style: Theme.of(context).textTheme.labelMedium, ),
                Flexible(child: Divider (color: dark ? SColors.darkGrey: Colors. grey, thickness: 0.5, indent: 5, endIndent: 60,)),
                ]
              ),
              SizedBox(height: SSizes.spaceBtwSections,),
              //footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: SColors.grey), borderRadius: BorderRadius.circular(100)),
                    child: IconButton(onPressed: (){}, icon: const Image(
                      width: SSizes.iconMd,
                      height: SSizes.iconMd,
                      image: AssetImage(SImages.google),
                    )),
                  ),
                  SizedBox(width: SSizes.spaceBtwItems,),
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: SColors.grey), borderRadius: BorderRadius.circular(100)),
                    child: IconButton(onPressed: (){}, icon: const Image(
                      width: SSizes.iconMd,
                      height: SSizes.iconMd,
                      image: AssetImage(SImages.facebook),
                    )),
                  ),
                ],
              )

          ]
          ),
    )
      )
    );
  }
}
