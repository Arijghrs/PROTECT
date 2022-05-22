import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protect/screens/login/LoginScreen.dart';
import 'package:protect/constants.dart';

import 'screens/On-boarding/On-boarding1.dart';
import 'screens/Splash_page/Splash_screen.dart';
import 'screens/Welcome_screen/Welcome.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/signup/signup_screen.dart';

void main() async{
  await Firebase.initializeApp();
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
    );
  }
}



