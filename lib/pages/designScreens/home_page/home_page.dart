import 'package:flutter/material.dart';
import 'package:flutter_app_with_docs_and_my_value/pages/designScreens/home_page/companents/body.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Home Page',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body(),
    );
  }
}
