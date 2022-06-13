import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:protect/constants.dart';
import 'package:protect/screens/heart_rate/widgets/Header.dart';

import '../heart_rate/widgets/header2.dart';
import '../login/LoginScreen.dart';

class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}
  final CollectionReference profileList =
  FirebaseFirestore.instance.collection('users');

class _EditScreenState extends State<EditScreen> {



  TextEditingController _Passwordcontroller = TextEditingController();

  TextEditingController _namecontroller = TextEditingController();

  @override
  void dispose() {
    _Passwordcontroller.dispose();

    _namecontroller.dispose();

    super.dispose();
  }
  String userID = "";
  @override
  void initState() {
    super.initState();
    fetchUserInfo();
  }
  fetchUserInfo() async {
    User getUser = await FirebaseAuth.instance.currentUser!;
    userID = getUser.uid;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header2(context),
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
                        title: Text('Change Name'),
                        content: TextFormField(
                          controller: _namecontroller,
                          decoration: InputDecoration(hintText: 'New Name'),
                        ),
                        actions: [
                          TextButton(onPressed:(){
                            updateUserName(_namecontroller.text,userID);
                            Navigator.of(context).pop();
                          }, child: Text('Submit') ),
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
                    'change Name',
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

            SizedBox(
              height: 50,
            ),
            OutlinedButton(
                onPressed: () { FirebaseAuth.instance.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => login()));},
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

Future updateUserpassword(String password, String uid) async {
  return await profileList.doc(uid).update({
    'Password': password
  });
}
Future updateUserName(String name, String uid) async {
  return await profileList.doc(uid).update({
    'name': name
  });
}


