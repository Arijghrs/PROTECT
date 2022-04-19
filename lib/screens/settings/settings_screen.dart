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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'settings',
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.indigo,
          ),
        ),
      ),
     /* body: Container(
        //padding: EdgeInsets.only((left: 16, top: 25, right: 16)),
        child: ListView(
          Divider(),
          Row(children: [

          ],)
        ),
      ),*/
    );
  }
}