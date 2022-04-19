import 'package:flutter/material.dart';
import 'package:protect/constants.dart';
import 'package:protect/screens/Edit_Profile/Edit.dart';
import 'package:protect/screens/settings/settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'profile',
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
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.indigo,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => EditScreen()));
            },
          ),
        ],
      ),
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
                        image: AssetImage('assets/images/avatar.png')
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
                        color: Colors.indigo
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3),
                labelText: "Full Name",
                fillColor: Colors.indigo,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "Arij Gharsalli",
                hintStyle: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold,
                  color: Colors.black54,
                )
              ),
            ),
            SizedBox(
              height: 35,
            ),
            TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 3),
                  labelText: "E-mail",
                  fillColor: Colors.indigo,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Arijgharsalli@gmail.com",
                  hintStyle: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  )
              ),
            ),
            SizedBox(
              height: 35,
            ),
            TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 3),
                  labelText: "Loation",
                  fillColor: Colors.indigo,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "Tunisia",
                  hintStyle: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  )
              ),
            ),
            SizedBox(
              height: 35,
            ),
            TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 3),
                  labelText: "Phone Number",
                  fillColor: Colors.indigo,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: "98654224",
                  hintStyle: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}