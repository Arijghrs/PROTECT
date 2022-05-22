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
          SizedBox(height: 80,),
          //header,
          Expanded(
              child: ListView(
                children: <Widget>[
                  ProfileListeItem(
                    icon: Icons.access_time,
                    text: 'Time zone' ,
                  ),
                   SizedBox(height: 20,),
                   ProfileListeItem(
                     icon: Icons.location_on,
                     text: 'location update '),
                  SizedBox(height: 20,),
                  ProfileListeItem(
                    icon: Icons.settings_sharp,
                    text: 'switch settings' ,),
                  SizedBox(height: 20,),
                  ProfileListeItem(
                    icon: Icons.watch_outlined,
                    text: 'choose a watch ' ,),
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
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color(0xFFE8EFF3),
      ),
      child: Row(
        children: <Widget>[
          //SizedBox(width: 20,),
          Icon(
            this.icon,
            size: 30,
            //color: Color(0xFF615E5E),
            color: kPrimaryColor,
          ),
          SizedBox(height: 40,width: 20,),
          Text(
            this.text,
            style: TextStyle(
                fontSize:20,
                fontWeight: FontWeight.w500,
                color: Color(0xFF615E5E)
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: Color(0xFF615E5E),
          ),
        ],
      ),
    );
  }
}