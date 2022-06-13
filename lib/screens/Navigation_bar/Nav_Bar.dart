import 'package:flutter/material.dart';
import 'package:protect/constants.dart';
import 'package:protect/screens/home_page/home_screen.dart';
import 'package:protect/screens/notification/notification_screen.dart';
import 'package:protect/screens/profile/profile_screen.dart';
import 'package:protect/screens/settings/settings_screen.dart';

import '../heart_rate/heart_rate_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: [
              HomePage(),
              HeartRate(),
              ProfileScreen(),
            ].elementAt(_page),
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CurvedNavigationBar(
              height: 55,
              color: NavColor,
              backgroundColor: Colors.transparent,
              buttonBackgroundColor: Colors.white,
              key: _bottomNavigationKey,
              items: <Widget>[
                Icon(Icons.home, size: 30),
                new Tab(
                  icon: CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(
                        'https://img.icons8.com/material/2x/activity.gif'),
                  ),
                ),
                Icon(Icons.account_circle, size: 30),
              ],
              onTap: (index) {
                setState(() {
                  _page = index;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
