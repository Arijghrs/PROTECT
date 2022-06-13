
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../components/already_have_an_account.dart';
import '../../constants.dart';
import '../Navigation_bar/Nav_Bar.dart';
import '../home_page/home_screen.dart';
import '../signup/signup_screen.dart';



class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}
class _loginState extends State<login> {
  void initState() {
    super.initState();
  }


  final _formkey = GlobalKey<FormState>();

  TextEditingController _resetemailcontroller= TextEditingController();

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    super.dispose();
  }


// Scaffold

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Form(
          key: _formkey,
          child: Stack(
            children: <Widget>[
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
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 120,
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Login',
                          style: TextStyle(
                            color: kBackgroundColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 0.1,),
                        SvgPicture.asset('assets/images/login.svg',
                          width: 250,
                          height: 250,
                        ),
                        SizedBox(height: 10,),
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
                        SizedBox(height: 20,),
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
                            Text("Login", style: TextStyle(
                                fontSize: 18,
                                color: Colors.white),),
                            style: ElevatedButton.styleFrom(
                                shape:
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(color: Color(0xff2970A5))),
                                primary: Color(0xff2970A5),
                                padding: EdgeInsets.all(6.0)),
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                             FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                   email: _emailcontroller.text,
                                        password: _passwordcontroller.text)
                                  .then((value) {
                                   Navigator.push(context,
                                   MaterialPageRoute(builder: (context) => Navbar()));
                                         }).onError((error, stackTrace) {
                                   showTopSnackBar(
                                    context,
                                     CustomSnackBar.error(
                                      message:
                                      "error${error.toString()}",
                                 ),
                               );
                                       });
                                     }

                            },
                          ),
                        ),
                        SizedBox(height: 20),

                        AlreadyHaveAnAccountCheck(
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return signup();
                                },
                              ),
                            );
                          },
                        ),
                        Text("Forgot password?",
                          style: TextStyle(color: kPrimaryColor),
                        ),
                        GestureDetector(
                          onTap: (){
                            showDialog(
                                context: context,
                                builder:(BuildContext context){
                                  return AlertDialog(
                                    title:Text('Reset password'),
                                    content: TextFormField(
                                      decoration: InputDecoration(hintText: 'Email'),
                                      controller: _resetemailcontroller,
                                    ),
                                    actions: [
                                      TextButton(onPressed:()async{
                                        await FirebaseAuth.instance.sendPasswordResetEmail(email:_resetemailcontroller.text.trim());
                                        Navigator.of(context).pop();
                                      }, child: Text('Submit') ),
                                      TextButton(
                                          onPressed: (){
                                            Navigator.of(context).pop();
                                          }, child: Text('Close'))
                                    ],
                                  );
                                });
                          } ,
                          child: Text(
                           "Reset Password",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}