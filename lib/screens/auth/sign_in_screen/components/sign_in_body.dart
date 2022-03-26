import 'package:easy_job_app/components/app_title.dart';
import 'package:easy_job_app/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../components/no_account_text.dart';
import '../../../../components/social_card.dart';
import 'sign_form.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                const AppTitle(),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.02,
                ),
                const Text(
                  "Sign in with your email and password \nor continue with social media.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                const SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {
                        _showButtonPressDialog(context, "WORKS");
                        // TODO: Implement Google SIGNIN
                      },
                    ),
                    SocialCard(
                      icon: "assets/icons/facebook-2.svg",
                      press: () {
                        _showButtonPressDialog(context, "WORKS");
                        // TODO: Implement FACEBOOK SIGNIN
                      },
                    ),
                    SocialCard(
                      icon: "assets/icons/twitter.svg",
                      press: () {
                        // TODO: Implement Twitter SIGNIN
                        _showButtonPressDialog(context, "WORKS");
                      },
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                const NoAccountText(),
                SizedBox(height: getProportionateScreenHeight(25)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showButtonPressDialog(BuildContext context, String provider) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('$provider Button Pressed!'),
      backgroundColor: Colors.black26,
      duration: const Duration(milliseconds: 400),
    ));
  }
}
