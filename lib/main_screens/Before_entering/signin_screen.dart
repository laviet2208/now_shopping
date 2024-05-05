import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ning_web/Button/Buttontype1.dart';
import 'package:ning_web/Finalclass/finalclass.dart';
import 'package:ning_web/main_screens/Before_entering/Controller/LoginController.dart';
import 'package:ning_web/main_screens/Before_entering/MobiScreen/SigninScreen.dart';
import 'package:ning_web/main_screens/Before_entering/signup_screen.dart';
import 'package:ning_web/main_screens/MainmenuScreen/mainmenu.dart';
import 'package:ning_web/utils/utils.dart';

import '../../General/Account/Account.dart';
//import '../../ManagerScreen/Mainmenu/mngMenu.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {

  final emailController = TextEditingController();
  final emailKey = GlobalKey<FormState>();

  final passController = TextEditingController();
  final passKey = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseReference database = FirebaseDatabase.instance.ref("Account");

  final formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;


    double BorderWidth = screenWidth / 3;
    double BorderHeight = screenHeight / 2.1;

    if (screenWidth < 850) {
      return SigninMobi();
    }

    return Scaffold(
      body: Stack(
        children: [
          // Figma Flutter Generator OrdersuccessWidget - FRAME
          Container(
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(
                boxShadow : [BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0,4),
                    blurRadius: 4
                )],
                color : Color.fromRGBO(255, 255, 255, 1),
              ),
              child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: screenHeight / 7.566,
                        left: screenWidth / 18.285,
                        child: Text('Sign in', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Dmsan_regular',
                            fontSize: screenWidth / 30,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),)
                    ),


                    Positioned(
                        top: screenHeight / 5.3,
                        left: screenWidth / 1.69 ,
                        child: Container(
                            width: screenWidth / 3.2,
                            height: screenWidth / 3.2,
                            decoration: BoxDecoration(
                              image : DecorationImage(
                                  image: AssetImage('assets/logo_1.png'),
                                  fit: BoxFit.fitWidth
                              ),
                            )
                        )
                    ),


                    Positioned(
                        top: screenHeight / 4.17,
                        left: screenWidth / 18.28,
                        child: Container(
                            width: BorderWidth,
                            height: BorderHeight,
                            decoration: BoxDecoration(
                              borderRadius : BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                              boxShadow : [BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(0,4),
                                  blurRadius: 4
                              )],
                              color : Color.fromRGBO(247, 247, 247, 1),
                              border : Border.all(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                width: 1,
                              ),
                            )
                        )
                    ),

                    //Forgot pass
                    Positioned(
                        top: screenHeight / 1.83,
                        left: screenWidth / 3.536,
                        child: Text('Forgot Password ?', textAlign: TextAlign.right, style: TextStyle(
                            color: Color.fromRGBO(0, 99, 255, 1),
                            fontFamily: 'DM Sans',
                            fontSize: screenWidth / 106.6,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),)
                    ),

                    //Sign in button
                    Positioned(
                      top: screenHeight / 1.68,
                      left: screenWidth / 14.12,
                      child: ButtonType1(Height: screenHeight / 16, Width: screenWidth / 7.38, color: Color.fromRGBO(255, 184, 0, 1), radiusBorder: 10, title: "Sign in", fontText: 'Dmsan_regular', colorText: Colors.black,
                      onTap: (){
                        if (formKey.currentState!.validate() && emailKey.currentState!.validate()) {
                          if (emailController.text.toString() == "Nowshopping123@@@"  && passController.text.toString() == "Nowshopping123@@@") {
                            //Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => MenuManager()));
                          } else{
                            setState(() {
                              loading = true;
                            });
                            _auth.signInWithEmailAndPassword(email: emailController.text.toString(), password: passController.text.toString()).then((value){
                              LoginController.getAccountData(emailController.text.toString());
                              setState(() {
                                loading = false;
                              });
                              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => MainMenuScreen()));
                            }).onError((error, stackTrace){
                              setState(() {
                                loading = false;
                              });
                              toastMessage(error.toString());
                              print(error.toString());
                            });
                          }

                        }
                      },
                        loading: loading,
                      ),
                    ),

                    //Sign up button
                    Positioned(
                      top: screenHeight / 1.68,
                      left: screenWidth / 4.39,
                      child: Container(
                        width: screenWidth / 7.38,
                        height: screenHeight / 16,
                        child: ButtonType1(Height: screenHeight / 16, Width: screenWidth / 7.38, color: Color.fromRGBO(255, 49, 49, 1), radiusBorder: 10, title: "Sign up", fontText: 'Dmsan_regular', colorText: Colors.white,
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => SignUpScreen()));
                          },
                        ),
                    ),
                    ),


                    //EditText email
                    Positioned(
                      top: screenHeight / 3.2,
                      left: screenWidth / 14.12,
                      child: Container(
                        width: screenWidth / 3.42,
                        height: screenHeight / 15.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        child: Form(
                          key: emailKey,
                          child: TextFormField(
                            controller: emailController,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dmsan_regular',
                              //Thêm textAlignVertical vào TextStyle
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter your Email";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              hintText: 'yourAccount@gmail.com',
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Dmsan_regular',
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                              isDense: true,
                              //Xóa contentVerticalAlignment trong InputDecoration
                            ),
                          ),
                        ),
                      ),
                    ),


                    //EditText pass
                    Positioned(
                      top: screenHeight / 2.25,
                      left: screenWidth / 14.12,
                      child: Container(
                        width: screenWidth / 3.42,
                        height: screenHeight / 15.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            controller: passController,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Dmsan_regular',
                              //Thêm textAlignVertical vào TextStyle
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter your Password";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Your password',
                              prefixIcon: Icon(Icons.lock_open),
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Dmsan_regular',
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                              isDense: true,
                              //Xóa contentVerticalAlignment trong InputDecoration
                            ),
                          ),
                        ),
                      ),
                    ),


                    Positioned(
                        top: screenHeight / 3.7,
                        left: screenWidth / 14.12,
                        child: Text('E-mail', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Dmsan_regular',
                            fontSize: screenWidth / 80,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),)
                    ),

                    Positioned(
                        top: screenHeight / 2.5,
                        left: screenWidth / 14.12,
                        child: Text('Password', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Dmsan_regular',
                            fontSize: screenWidth / 80,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),)
                    ),
                  ]
              )
          )
        ],
      ),
    );
  }
}
