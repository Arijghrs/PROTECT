import 'package:flutter/material.dart';
import 'package:protect/constants.dart';
import 'package:protect/components/input_container.dart';

class RoundedPasswordInput extends StatelessWidget {
  RoundedPasswordInput({
    Key? key,
    required this.hint
  }) : super(key: key);

final String hint;
TextEditingController _passwordController =TextEditingController();
  @override
  Widget build( context) {
    return InputContainer(
        child: TextFormField(
          controller: _passwordController,
          validator:  (value) {
          if (value != null && value.isEmpty) {
          return "password can't be empty";
         }

         return null;
        } ,
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