import 'package:flutter/material.dart';
import 'package:protect/constants.dart';

class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Profile',
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
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            /*Text('Settings',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),*/
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.indigo,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Account',
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.black54),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Change password'),
                        content: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [],
                        ),
                        actions: [
                          TextButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                          }, child: Text('Close'))
                        ],
                      );
                    }
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'change Password',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  )
                ],
              ),
            ),



            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Change phone number'),
                        content: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [],
                        ),
                        actions: [
                          TextButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              }, child: Text('Close'))
                        ],
                      );
                    }
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'change phone number',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  )
                ],
              ),
            ),



            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Change phone number'),
                        content: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [],
                        ),
                        actions: [
                          TextButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              }, child: Text('Close'))
                        ],
                      );
                    }
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'change Language',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  )
                ],
              ),
            ),


            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Change phone number'),
                        content: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [],
                        ),
                        actions: [
                          TextButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              }, child: Text('Close'))
                        ],
                      );
                    }
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'change Location',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  )
                ],
              ),
            ),



            SizedBox(
              height: 50,
            ),
            OutlinedButton(
                onPressed: () {},
                child: Text('SIGN OUT',
                  style: TextStyle(
                    fontSize: 16, letterSpacing: 2.2, color: Colors.indigo
                   ),
                )
            ),
          ],
        ),
      ),
    );
  }
}