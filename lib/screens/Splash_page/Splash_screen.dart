import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:protect/constants.dart';
import 'package:protect/screens/On-boarding/On-boarding1.dart';
import 'package:protect/screens/Welcome_screen/Welcome.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Column(
          children: [
            Icon(
              Icons.location_on,
              color: Colors.orange,
              size: 170,
            ),
            //SvgPicture.asset('assets/images/location.svg', height: 150,),
            SizedBox(
              height: 20,
            ),
            const Text(
              'Protect your kid',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60,
              ),
            )
          ],
        ),
        nextScreen: OnBoardingPage(),
      splashIconSize: 250,
      duration: 3000,
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 1),
      backgroundColor: kPrimaryColor,

    );
  }
}