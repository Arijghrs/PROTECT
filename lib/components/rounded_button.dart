import 'package:flutter/material.dart';
import 'package:protect/constants.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback press;
  const RoundedButton({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.08,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kPrimaryColor,
        ),

        padding: EdgeInsets.symmetric(vertical: 20),
        alignment: Alignment.center,
        child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15
            )
        ),
      ),
    );
  }
}