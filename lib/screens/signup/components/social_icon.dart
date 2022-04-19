import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:protect/constants.dart';

class SocialIcon extends StatelessWidget {
  final String iconSrc;
  final void Function() press;
  const SocialIcon({
    Key? key,
    required this.iconSrc,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.white,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSrc,
          fit: BoxFit.fitWidth,
          height: 50,
          width: 50,
        ),
      ),
    );
  }
}
