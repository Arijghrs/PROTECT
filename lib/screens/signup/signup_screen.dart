import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


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
                              Color(0xFFE5E5E5),
                              Color(0xFFE5E5E5),
                              Color(0xFFE5E5E5),
                              Color(0xFFE5E5E5),
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
                                color: kPrimaryColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 40,),
                            SizedBox(height:0.1,),
                            Container(
                              width: 320,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Color(0xFFd1dfe9),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _namecontroller,
                                    decoration: InputDecoration(
                                        labelText: 'name',
                                        labelStyle: TextStyle(
                                            color:Colors.black
                                        )
                                    ),
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'Please Fill name Input';
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 40,),
                            SizedBox(height:0.1,),
                            Container(
                              width: 320,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Color(0xFFd1dfe9),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _emailcontroller,
                                    decoration: InputDecoration(
                                        labelText: 'Email',
                                        labelStyle: TextStyle(
                                            color:Colors.black
                                        )
                                    ),
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'Please Fill Email ';
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 40,),
                            SizedBox(height: 0.1,),
                            Container(
                              width: 320,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Color(0xFFd1dfe9),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Column(
                                children: [
                                  TextFormField(
                                    obscureText: true,
                                    controller: _passwordcontroller,
                                    decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: TextStyle(
                                            color:Colors.black
                                        )
                                    ),
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'Please Fill Password Input';
                                      }
                                    },
                                  )
                                ],
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
                                      password: _passwordcontroller.text.trim())
                                      .then((value) {
                                    print("Created New Account");
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => login()));
                                  }).onError((error, stackTrace) {
                                    print("Error ${error.toString()}");
                                  });
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return login();
                                  }));

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