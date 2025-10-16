import 'package:ecommereceapp/%20utils/constants/colors.dart';
import 'package:ecommereceapp/%20utils/constants/text_strings.dart';
import 'package:ecommereceapp/helpers/helper_function.dart';
import 'package:ecommereceapp/screens/auth/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ utils/constants/image_strings.dart';
import '../../ utils/constants/sizes.dart';
import '../../providers/auth_provider.dart';
import '../home/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _signup(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    await authProvider.signup(
      nameController.text.trim(),
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
    final dark = SHelperFunctions.isDarkMode(context);
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Text(
                STexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: SSizes.spaceBtwSections),
              //form
              Form(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: InputDecoration(
                              labelText: STexts.firstName,
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                        ),
                        SizedBox(width: SSizes.spaceBtwInputFields),
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: InputDecoration(
                              labelText: STexts.lastName,
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SSizes.spaceBtwInputFields),

                    // Username
                    TextFormField(
                      expands: false,
                      decoration: InputDecoration(
                        labelText: STexts.username,
                        prefixIcon: Icon(Icons.perm_identity_sharp),
                      ),
                    ),
                    SizedBox(height: SSizes.spaceBtwInputFields),

                    // Email
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: STexts.email,
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                    SizedBox(height: SSizes.spaceBtwInputFields),

                    // Phone Number
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: STexts.phoneNo,
                        prefixIcon: Icon(Icons.call),
                      ),
                    ),
                    const SizedBox(height: SSizes.spaceBtwInputFields),
                    // Password
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: STexts.password,
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: Icon(Icons.remove_red_eye_rounded),
                      ),
                    ),
                    SizedBox(height: SSizes.spaceBtwSections),
                    // Terms & Condition checkbox
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        SizedBox(width: SSizes.spaceBtwItems),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '${STexts.iAgreeTo}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextSpan(
                                text: '${STexts.privacyPolicy} ',
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .apply(
                                      color: dark
                                          ? SColors.white
                                          : SColors.primary,
                                      decoration: TextDecoration.underline,
                                      decorationColor: dark
                                          ? SColors.white
                                          : SColors.primary,
                                    ),
                              ),
                              TextSpan(
                                text: '${STexts.and}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextSpan(
                                text: ' ${STexts.termsOfUse}',
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .apply(
                                      color: dark
                                          ? SColors.white
                                          : SColors.primary,
                                      decoration: TextDecoration.underline,
                                      decorationColor: dark
                                          ? SColors.white
                                          : SColors.primary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SSizes.spaceBtwSections),
                    //SignUP Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>  VerifyEmailScreen(),
                            ),
                          );
                        },
                        child: Text(STexts.createAccount),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SSizes.spaceBtwSections),
              //Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Divider(
                      color: dark ? SColors.darkGrey : Colors.grey,
                      thickness: 0.5,
                      indent: 60,
                      endIndent: 5,
                    ),
                  ),
                  Text(
                    STexts.orSignInWith,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Flexible(
                    child: Divider(
                      color: dark ? SColors.darkGrey : Colors.grey,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 60,
                    ),
                  ),
                ],
              ),
              SizedBox(height: SSizes.spaceBtwSections),
              //footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: SColors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        width: SSizes.iconMd,
                        height: SSizes.iconMd,
                        image: AssetImage(SImages.google),
                      ),
                    ),
                  ),
                  SizedBox(width: SSizes.spaceBtwItems),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: SColors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        width: SSizes.iconMd,
                        height: SSizes.iconMd,
                        image: AssetImage(SImages.facebook),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
