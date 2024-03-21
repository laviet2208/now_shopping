import 'package:flutter/material.dart';
import 'package:ning_web/Button/Buttontype1.dart';
import 'package:ning_web/main_screens/Before_entering/Controller/SignupController.dart';
import 'package:ning_web/main_screens/Before_entering/MobiScreen/SignupScreen.dart';
import 'dart:math';

import 'package:ning_web/main_screens/Before_entering/signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();


}

class _SignUpScreenState extends State<SignUpScreen> {


  @override
  Widget build(BuildContext context) {
    double textWidth = 10;
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    double LogoWidth = screenWidth * 0.5;
    double LogoHeight = screenHeight / 5.0 * 3.0;
    double BorderWidth = screenWidth / 3;
    double BorderHeight = screenHeight / 1.37;
    bool loading = false;

    final SignupController signupController = SignupController();
    signupController.context = context;

    if (screenWidth < 850) {
      return SignupScreenMobi();
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
                        child: Text('Sign up', textAlign: TextAlign.left, style: TextStyle(
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

                    //change to signin
                    Positioned(
                        top: screenHeight / 1.19,
                        left: screenWidth / 3.75,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => SigninScreen()));
                          },
                          child: Text('Have a account? Sign in', textAlign: TextAlign.right, style: TextStyle(
                              color: Color.fromRGBO(0, 99, 255, 1),
                              fontFamily: 'Dmsan_regular',
                              fontSize: screenWidth / 106.6,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1
                          ),
                          )
                          )
                    ),

                    //Sign up button
                    Positioned(
                      top: screenHeight / 1.14,
                      left: screenWidth / 14.12,
                      child: ButtonType1(Height: screenHeight / 16, Width: screenWidth / 3.42, color: Color.fromRGBO(255, 49, 49, 1), radiusBorder: 10, title: "Sign up", fontText: 'Dmsan_regular', colorText: Colors.white,
                             onTap: (){
                                  signupController.signUpPressed();
                                  setState(() {
                                    loading = signupController.loading;
                                  });
                             } , loading: loading,
                      ),
                    ),


                    //EditText Name
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
                        child: TextFormField(
                          controller: signupController.nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your Name";
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Dmsan_regular',
                            //Thêm textAlignVertical vào TextStyle
                          ),
                          decoration: InputDecoration(
                            hintText: 'Alexander tamabel',
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


                    //EditText Email
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
                        child: TextFormField(
                          controller: signupController.emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your Email";
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Dmsan_regular',
                            //Thêm textAlignVertical vào TextStyle
                          ),
                          decoration: InputDecoration(
                            hintText: 'Your Email@gmail.com',
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


                    //EditText Pass
                    Positioned(
                      top: screenHeight / 1.65,
                      left: screenWidth / 14.12,
                      child: Container(
                        width: screenWidth / 3.42,
                        height: screenHeight / 15.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        child: TextFormField(
                          controller: signupController.passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your Pass";
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Dmsan_regular',
                            //Thêm textAlignVertical vào TextStyle
                          ),
                          decoration: InputDecoration(
                            hintText: 'Your Pass',
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

                    //EditText Re Pass
                    Positioned(
                      top: screenHeight / 1.33,
                      left: screenWidth / 14.12,
                      child: Container(
                        width: screenWidth / 3.42,
                        height: screenHeight / 15.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        child: TextFormField(
                          controller: signupController.repasswordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Re fill your password";
                            }
                            return null;
                          },
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Dmsan_regular',
                            //Thêm textAlignVertical vào TextStyle
                          ),
                          decoration: InputDecoration(
                            hintText: 'Re Password',
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

                    Positioned(
                        top: screenHeight / 3.7,
                        left: screenWidth / 14.12,
                        child: Text('Name', textAlign: TextAlign.left, style: TextStyle(
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
                        child: Text('E-Mail', textAlign: TextAlign.left, style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Dmsan_regular',
                            fontSize: screenWidth / 80,
                            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),)
                    ),

                    Positioned(
                        top: screenHeight / 1.776,
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

                    Positioned(
                        top: screenHeight / 1.4,
                        left: screenWidth / 14.12,
                        child: Text('Re-Password', textAlign: TextAlign.left, style: TextStyle(
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
