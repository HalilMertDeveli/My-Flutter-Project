import 'package:flutter/material.dart';
import 'package:flutter_app_with_docs_and_my_value/pages/designScreens/companents/default_button.dart';
import 'package:flutter_app_with_docs_and_my_value/pages/designScreens/splashScreen/splash_content.dart';
import 'package:flutter_app_with_docs_and_my_value/pages/sign_in_my_value/sign_in_page_my_value.dart';
import 'package:flutter_app_with_docs_and_my_value/pages/sign_in_page.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {
      "text": "Hello Everyone It's the Ghost Music",
      "image": "assets/ourAssets/ghost1.png"
    },
    {
      "text": "We are lisning music and happy here",
      "image": "assets/ourAssets/ghost2.png"
    },
    {
      "text": "If you want to join us just sign-up ",
      "image": "assets/ourAssets/ghost3.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Spacer(
                flex: 1,
              ),
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
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
              ),
              Spacer(
                flex: 1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: DefaultButton(
                    text: 'Continue',
                    press: () {
                      directionSignInPage(context);
                    }),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  directionSignInPage(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignInPageMyValue(),
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
          color: currentPage == index ? Colors.yellow : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
