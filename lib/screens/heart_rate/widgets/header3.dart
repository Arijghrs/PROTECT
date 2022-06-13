import 'package:flutter/material.dart';
import 'package:protect/constants.dart';

import '../../Edit_Profile/Edit.dart';

AppBar header3(context) {
  return AppBar(
      backgroundColor: Colors.transparent,
      title: const Text(
        'Profile',
        style: TextStyle(fontSize: 19),
      ),
      centerTitle: true,
  actions: [
    IconButton(icon: Icon(Icons.settings),
    onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)
      =>EditScreen()
      )
      );
    },
    )
  ],

      elevation: 10,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            gradient: LinearGradient(
                colors: [kPrimaryColor, Colors.black87],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft)),
      ));
}