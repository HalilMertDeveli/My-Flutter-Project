import 'package:flutter/material.dart';
import 'package:flutter_app_with_docs_and_my_value/pages/designScreens/sign_in_screen/companents/body.dart';

class SignInPageMyValue extends StatelessWidget {
  const SignInPageMyValue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Body(),
    );
  }
}
