import 'package:flutter/material.dart';
import 'package:protect/constants.dart';
import 'package:protect/components/input_container.dart';

class RoundedInput extends StatelessWidget {
   RoundedInput({
    Key? key,

    required this.icon,
    required this.hint,
  }) : super(key: key);


  final IconData icon;
  final String hint;
  final TextEditingController _emailController=TextEditingController();

  @override
  Widget build( context) {
    return InputContainer(
        child: TextFormField(
          controller: _emailController,
          validator: (String? value) {
           if (value != null && value.isEmpty) {
            return "Username can't be empty";
           }

         return null;
         },
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
          icon: Icon(icon, color: kPrimaryColor),
            hintText: hint,
            border: InputBorder.none
      ),
    ));
  }
}

