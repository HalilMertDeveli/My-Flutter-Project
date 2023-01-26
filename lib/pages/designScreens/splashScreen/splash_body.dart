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
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
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
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(splashData.length,
                            (index) => buildDot(index: index)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      //make duration const
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? Colors.orange : Colors.white,
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
