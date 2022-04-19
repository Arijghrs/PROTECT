import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:protect/components/already_have_an_account.dart';
import 'package:protect/components/rounded_button.dart';
import 'package:protect/components/rounded_input.dart';
import 'package:protect/components/rounded_password_input.dart';
import 'package:protect/constants.dart';
import 'package:protect/screens/login/LoginScreen.dart';
import 'package:protect/screens/signup/components/background.dart';
import 'package:protect/screens/signup/components/or_divider.dart';
import 'package:protect/screens/signup/components/social_icon.dart';

class Body extends StatelessWidget {
  final Widget child;

  const Body({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'SIGNUP',
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 20,
                 color: kPrimaryColor,
               )
        ),
          SizedBox(height: size.height * 0.03),
          /*SvgPicture.asset(
             ,
            height: size.height * 0.35,
          ),*/

          SizedBox(height: 5),

          RoundedInput(
              icon: Icons.mail,
              hint: "Your Email"
          ),

          SizedBox(height: 5),

          RoundedPasswordInput(hint: 'Passwoord'),

          SizedBox(height: 5),

          RoundedPasswordInput(hint: 'Confirm you Passwoord'),

          SizedBox(height: 10),

          RoundedButton(
            title: 'SIGNUP',
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),

          SizedBox(height: 30),

          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                ),
              );
            },
          ),
          SizedBox(height: 30),
          OrDivider(),
          SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SocialIcon(
                iconSrc: 'assets/images/facebook2.svg',
                press: () {},
              ),
              SocialIcon(
                iconSrc: 'assets/images/googleclr.svg',
                press: () {},
              ),
              SocialIcon(
                iconSrc: 'assets/images/twitter2.svg',
                press: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}





