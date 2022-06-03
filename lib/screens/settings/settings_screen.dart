import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protect/constants.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = 200.0;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("HeartRate Monitor", textAlign: TextAlign.center),
        ),
        body: Center(

                      child: Container(
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: NetworkImage('https://img.icons8.com/ios-filled/2x/activity.gif'))
                        ),

                    child: Text('98BPM',textAlign: TextAlign.center,style: TextStyle(fontStyle: FontStyle.italic,fontSize: 20,)),  ),


                    ),


                ),
    );
    Container();
  }
  }