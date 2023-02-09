import 'package:flutter/material.dart';
import 'package:flutter_app_with_docs_and_my_value/old_firebase_folders/model/user.dart';
import 'package:flutter_app_with_docs_and_my_value/old_firebase_folders/home_page.dart';
import 'package:flutter_app_with_docs_and_my_value/old_firebase_folders/sign_in_page.dart';

class PageSelector extends StatelessWidget {
  const PageSelector({super.key, required this.snapshot});

  final AsyncSnapshot<AppUser?> snapshot;

  @override
  Widget build(BuildContext context) {
    if (snapshot.connectionState == ConnectionState.active) {}
    {
      return snapshot.hasData ? HomePage() : SignInPage();
    }
  }
}
