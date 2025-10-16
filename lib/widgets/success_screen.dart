import 'package:ecommereceapp/common/styles/spacing_styles.dart';
import 'package:flutter/material.dart';

import '../ utils/constants/sizes.dart';
import '../ utils/constants/text_strings.dart';
import '../screens/auth/login_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SSpacingStyles.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              //title and subTitle
              Text(
                STexts.yourAccountCreatedTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SSizes.spaceBtwItems),
              Text(
                STexts.yourAccountCreatedSubtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SSizes.spaceBtwItems),

              //Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  },
                  child: Text(STexts.Scontinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
