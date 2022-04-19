import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protect/screens/login/LoginScreen.dart';
import 'package:protect/constants.dart';

import 'screens/Splash_page/Splash_screen.dart';
import 'screens/Welcome_screen/Welcome.dart';
import 'screens/signup/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)
      ),
      home: SplashScreen(),
      /*routes: {
        'Login': (context) => SignUpScreen(),
      }*/
    );
  }
}



