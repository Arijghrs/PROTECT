import 'package:flutter/material.dart';
import 'package:protect/constants.dart';
import 'package:protect/screens/home_page/home_screen.dart';
import 'package:protect/screens/notification/notification_screen.dart';
import 'package:protect/screens/profile/profile_screen.dart';
import 'package:protect/screens/settings/settings_screen.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    HomePage(),
    NotificationScreen(),
    SettingsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'notification'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'settings'),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 14,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
              label: 'profile'),
        ],
      ),
    );
  }
}