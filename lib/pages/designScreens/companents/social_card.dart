import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialCards extends StatelessWidget {
  const SocialCards({super.key, required this.icon, required this.press});

  final String icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.all(10),
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
