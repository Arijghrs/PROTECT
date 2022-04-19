import 'package:flutter/material.dart';
import 'package:protect/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "don't have an Account ?" : "Already have an Account ? ",
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? " SIGN UP" : "SIGN IN",
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}