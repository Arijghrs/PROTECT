import 'package:flutter/material.dart';
import 'package:protect/constants.dart';
import 'package:protect/constants.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => RaisedButton(
    onPressed: onClicked,
    color: kPrimaryColor,
    shape: StadiumBorder(),
    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
    child: Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
  );
}