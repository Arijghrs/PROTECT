import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:protect/AuthenticationService.dart';
import 'package:protect/components/already_have_an_account.dart';
import 'package:protect/components/rounded_button.dart';
import 'package:protect/constants.dart';
import 'package:protect/components/rounded_input.dart';
import 'package:protect/components/rounded_password_input.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:protect/screens/Navigation_bar/Nav_Bar.dart';
import 'package:protect/screens/home_page/home_screen.dart';
import 'package:protect/screens/signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();


}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{
  bool isLogin = true ;

  final _formkey=GlobalKey<FormState>();
  final AuthenticationService _auth =AuthenticationService();



  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;

    double viewInset = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);


    return Scaffold(
      body: Stack(
        key:_formkey,
        children: [

          //Login form
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child:Container(
                width: size.width,
                height: defaultLoginSize,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: kPrimaryColor,
                      ),
                    ),

                    SizedBox(height: 0.1),


                    SvgPicture.asset('assets/images/login.svg',
                    width: 250,
                    height: 250,
                    ),

                    SizedBox(height: 5),

                    RoundedInput(icon: Icons.mail, hint: 'Username'),

                    RoundedPasswordInput(hint: 'Passwoord'),

                    SizedBox(height: 5),

                    RoundedButton(
                      title: 'LOGIN',
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context){
                                  return Navbar();
                             },
                            ),
                        );
                      },
                    ),

                    SizedBox(height: 20),

                    AlreadyHaveAnAccountCheck(
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context){
                                    return SignUpScreen();
                                  },
                              ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}







