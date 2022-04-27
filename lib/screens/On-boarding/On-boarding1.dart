import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:protect/constants.dart';
import 'package:protect/screens/On-boarding/buton.dart';
import 'package:protect/screens/Welcome_screen/Welcome.dart';
import 'package:protect/screens/home_page/home_screen.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
    child: IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Welcome to protect your kid',
          body: 'The man who neler leads mives only one.',
          image: SvgPicture.asset('assets/images/kids.svg'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'reatured wooks',
          body: 'Avai lable rit at yur fingeprint',
          image: SvgPicture.asset('assets/images/Paper map-pana.svg'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Simle visid',
          body: 'For enchanced redig eperienced',
          image: buildImage('assets/images/undraw_play_time_7k7b.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'to your child, be a lred peti  ',
          body: 'Start your journey',
          footer: ButtonWidget(
            text: 'Get started',
            onClicked: () => goToHome(context),
          ),
          image: buildImage('assets/images/undraw_back_to_school_inwc.png'),
          decoration: getPageDecoration(),
        ),
      ],
      done: Text('Read', style: TextStyle(fontWeight: FontWeight.w600,color: kPrimaryColor)),
      onDone: () => goToHome(context),
      showSkipButton: true,
      skip: Text('Skip',style: TextStyle(color: kPrimaryColor),),
      onSkip: () => goToHome(context),
      next: Icon(Icons.arrow_forward,color: kPrimaryColor,),
      dotsDecorator: getDotDecoration(),
      onChange: (index) => print('Page $index selected'),
      globalBackgroundColor: Theme.of(context).primaryColor,
      skipFlex: 0,
      nextFlex: 0,
      // isProgressTap: false,
      // isProgress: false,
      // showNextButton: false,
      // freeze: true,
      // animationDuration: 1000,
    ),
  );

  void goToHome(context) => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (_) => WelcomePage()),
  );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
    color: Color(0xFFBDBDBD),
    activeColor: Colors.orange,
    size: Size(10, 10),
    activeSize: Size(22, 10),
    activeShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
  );

  PageDecoration getPageDecoration() => PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: kPrimaryColor),
    bodyTextStyle: TextStyle(fontSize: 20, color: Colors.blue.shade900),
    descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
    imagePadding: EdgeInsets.all(24),
    pageColor: Colors.white,
  );
}