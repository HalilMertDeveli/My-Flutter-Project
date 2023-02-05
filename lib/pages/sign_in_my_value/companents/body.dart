import 'package:flutter/material.dart';
import 'package:flutter_app_with_docs_and_my_value/pages/designScreens/companents/default_button.dart';
import 'package:flutter_app_with_docs_and_my_value/pages/designScreens/companents/no_account_text.dart';
import 'package:flutter_app_with_docs_and_my_value/pages/designScreens/companents/social_card.dart';
import 'package:flutter_app_with_docs_and_my_value/pages/sign_in_my_value/companents/sign_form.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Text(
            'Welcome Back',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Sign In email and password \n or continue with social Media',
            textAlign: TextAlign.center,
          ),
          SingInForm(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialCards(
                icon: 'assets/icons/facebook-2.svg',
                press: () {},
              ),
              SocialCards(
                icon: 'assets/icons/twitter.svg',
                press: () {},
              ),
              SocialCards(
                icon: 'assets/icons/google-icon.svg',
                press: () {},
              ),
            ],
          ),
          NoAccountText()
        ],
      ),
    ));
  }
}
