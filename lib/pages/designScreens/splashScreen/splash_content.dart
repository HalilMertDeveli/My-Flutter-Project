import 'package:flutter/material.dart';

class SplashContent extends StatelessWidget {
  SplashContent({
    super.key,
    required this.text,
    required this.image,
  });

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        //change and make final color and size const later
        Text(
          'Ghost Music',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),

        Image.asset(
          image,
          height: 200,
          width: 200,
        ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
