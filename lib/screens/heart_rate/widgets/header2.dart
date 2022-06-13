import 'package:flutter/material.dart';
import 'package:protect/constants.dart';

AppBar header2(context) {
  return AppBar(
      backgroundColor: Colors.transparent,
      title: const Text(
        'Edit Profile',
        style: TextStyle(fontSize: 19),
      ),
      centerTitle: true,

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