import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:protect/constants.dart';
import 'package:protect/screens/Edit_Profile/Edit.dart';
import 'package:protect/screens/heart_rate/widgets/header3.dart';
import 'package:protect/screens/settings/settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header3(context),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 4,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2, blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0,10)
                        )
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile.png')
                      )
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        color: Colors.green
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Text(''),
            SizedBox(
              height: 35,
            ),
            TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 3),
                  labelText: "E-mail",
                  fillColor: Colors.indigo,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Write here",
                  hintStyle: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  )
              ),
            ),
            SizedBox(
              height: 35,
            ),


          ],
        ),
      ),
    );
  }
}