import 'package:flutter/material.dart';
import 'package:flutter_app_with_docs_and_my_value/pages/designScreens/splashScreen/splash_content.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {"text": "Ghost Music1", "image": "assets/phone.jpg"},
    {"text": "Ghost Music2", "image": "assets/phone.jpg"},
    {"text": "Ghost Music3", "image": "assets/phone.jpg"}
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                      image: splashData[index]['image']!,
                      text: splashData[index]['text']!)),
            )
          ],
        ),
      ),
    );
  }
}
