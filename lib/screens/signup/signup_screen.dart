import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';


import '../../constants.dart';
import '../login/LoginScreen.dart';

class signup extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _signup();
  }
}
class _signup extends State<signup> {
  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  bool checkboxValue = false;
  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  TextEditingController _namecontroller= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            key: _formKey,
            child: Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF003973),
                              Color(0xFFE5E5BE),
                            ]
                        )
                    ),
                    child:SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 120,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget>[
                            Text(
                              'SignUp',
                              style: TextStyle(
                                color: kBackgroundColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 40,),
                            SvgPicture.asset('assets/images/signup.svg',
                              width: 150,
                              height: 150,
                            ),
                            SizedBox(height: 20,),
                            SizedBox(height:0.1,),
                            Container(
                              width: 320,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  color: Color(0xFFd1dfe9),
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 6,
                                        offset: Offset(0, 2)
                                    )
                                  ]
                              ),
                              height: 60,
                              child: TextFormField(
                                controller: _namecontroller,
                                cursorColor: kPrimaryColor,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 14),
                                    prefixIcon: Icon(
                                        Icons.account_circle, color: kPrimaryColor),
                                    hintText: 'Name',
                                    border: InputBorder.none
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Fill Email Input';
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 15,),
                            SizedBox(height:0.1,),
                            Container(
                              width: 320,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  color: Color(0xFFd1dfe9),
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 6,
                                        offset: Offset(0, 2)
                                    )
                                  ]
                              ),
                              height: 60,
                              child: TextFormField(
                                controller: _emailcontroller,
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: kPrimaryColor,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 14),
                                    prefixIcon: Icon(
                                        Icons.email, color: kPrimaryColor),
                                    hintText: 'Email',
                                    border: InputBorder.none
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Fill Email Input';
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 15,),
                            SizedBox(height: 0.1,),
                            Container(
                              width: 320,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                  color: Color(0xFFd1dfe9),
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 6,
                                        offset: Offset(0, 2)
                                    )
                                  ]
                              ),
                              height: 60,
                              child: TextFormField(
                                obscureText: true,
                                controller: _passwordcontroller,
                                keyboardType: TextInputType.visiblePassword,
                                cursorColor: kPrimaryColor,
                                decoration: InputDecoration(

                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                      Icons.lock, color: kPrimaryColor),
                                  hintText: 'Password',
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please Fill Password Input';
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 20,),
                            SizedBox(
                              height: 50,
                              width: 320,
                              child: ElevatedButton(
                                child:
                                Text("Sign Up" ,style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white),),
                                style: ElevatedButton.styleFrom(
                                    shape:
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),
                                        side: BorderSide(color: Color(0xff2970A5))),
                                    primary: Color(0xff2970A5),
                                    padding: EdgeInsets.all(6.0)),
                                onPressed: () async {
                                    FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                        email: _emailcontroller.text.trim(),
                                        password: _passwordcontroller.text
                                            .trim())
                                        .then((value) async {
                                      User? user = FirebaseAuth.instance
                                          .currentUser;

                                      await FirebaseFirestore.instance
                                          .collection("users")
                                          .doc(user?.uid)
                                          .set({
                                        'uid': user?.uid,
                                        'name': _namecontroller.text,
                                        'email': _emailcontroller.text,
                                        'password': _passwordcontroller.text,
                                      });
                                      showTopSnackBar(
                                        context,
                                        CustomSnackBar.success(
                                          message:
                                          "Account created",
                                        ),
                                      );;
                                      Navigator.push(context,
                                          MaterialPageRoute(
                                              builder: (context) => login()));
                                    }).onError((error, stackTrace) {
                                      showTopSnackBar(
                                        context,
                                        CustomSnackBar.error(
                                          message:
                                          "Error ${error.toString()}",
                                        ),
                                      );
                                    });

                                  },
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                ]
            )
        )
    );
  }
}