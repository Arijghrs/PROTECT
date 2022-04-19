import 'package:flutter/material.dart';
import 'package:protect/constants.dart';
import 'package:protect/components/input_container.dart';

class RoundedPasswordInput extends StatelessWidget {
  const RoundedPasswordInput({
    Key? key,
    required this.hint
  }) : super(key: key);

final String hint;

  @override
  Widget build( context) {
    return InputContainer(
        child: TextField(
          cursorColor: kPrimaryColor,
          obscureText: true,
          decoration: InputDecoration(
             icon: Icon(Icons.lock, color: kPrimaryColor),
              hintText: hint,
              border: InputBorder.none,
          ),
        ));
  }
}