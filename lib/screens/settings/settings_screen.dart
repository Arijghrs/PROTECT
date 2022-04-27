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
      body: Column(
        children: <Widget>[
          SizedBox(height: 100,),
          //header,
          Expanded(
              child: ListView(
                children: <Widget>[
                  ProfileListeItem(
                    icon: Icons.access_time,
                    text: 'Time zone' ,
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}


class ProfileListeItem extends StatelessWidget {
  final IconData icon;
  final text;
  //final bool hasNavigation;

  const ProfileListeItem({
    Key? key,
    this.text,
    required this.icon,
    //required this.hasNavigation,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xFF7C9BAC),
      ),
    );
  }
}