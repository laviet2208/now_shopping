import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ning_web/Button/Buttontype1.dart';
import 'package:ning_web/main_screens/Before_entering/Controller/SignupController.dart';
import 'dart:math';

import 'package:ning_web/main_screens/Before_entering/signin_screen.dart';
import 'package:ning_web/utils/utils.dart';

import '../home_screen.dart';

class SignupScreenMobi extends StatefulWidget {
  const SignupScreenMobi({Key? key}) : super(key: key);

  @override
  State<SignupScreenMobi> createState() => _SignupScreenMobiState();
}

class _SignupScreenMobiState extends State<SignupScreenMobi> {
  final SignupController signupController = SignupController();
  String referralCode = '';
  void getData() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("inviteCode").onValue.listen((event) {
      final dynamic bill = event.snapshot.value;
      referralCode = bill.toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    signupController.context = context;
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    bool loading = false;

    return WillPopScope(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ListView(
                      children: [
                        SizedBox(height: 20,),

                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => HomeScreen()));
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        Container(height: 20,),

                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'SIGN UP & PROFILE',
                            style: TextStyle(
                                fontFamily: 'logo_font_1',
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                        Container(height: 30,),

                        Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text('E-mail', textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 12, 26, 48),
                                  fontFamily: 'arial',
                                  fontSize: screenWidth / 24,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.bold,
                                  height: 1
                              ),
                            )
                        ),

                        Container(height: 10,),

                        //edit mail
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            width: screenWidth * 0.854,
                            height: screenHeight * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(237, 237, 237, 1.0),
                            ),

                            child: TextFormField(
                              controller: signupController.emailController,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Dmsan_regular',
                              ),
                              decoration: InputDecoration(
                                hintText: 'Your Email@gmail.com',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 196, 197, 196),
                                  fontFamily: 'Dmsan_regular',
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                isDense: true,
                              ),
                            ),
                          ),
                        ),

                        Container(height: 20,),

                        Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text('Password', textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 12, 26, 48),
                                  fontFamily: 'arial',
                                  fontSize: screenWidth / 24,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.bold,
                                  height: 1
                              ),
                            )
                        ),

                        Container(height: 10,),

                        //edit pass
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            width: screenWidth * 0.854,
                            height: screenHeight * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(237, 237, 237, 1.0),
                            ),

                            child: TextFormField(
                              controller: signupController.passwordController,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Dmsan_regular',
                              ),
                              decoration: InputDecoration(
                                hintText: 'Type your password',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 196, 197, 196),
                                  fontFamily: 'Dmsan_regular',
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                isDense: true,
                              ),
                            ),
                          ),
                        ),

                        Container(height: 20,),

                        Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text('Re-Password', textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 12, 26, 48),
                                  fontFamily: 'arial',
                                  fontSize: screenWidth / 24,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.bold,
                                  height: 1
                              ),
                            )
                        ),

                        Container(height: 10,),

                        //edit repass
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            width: screenWidth * 0.854,
                            height: screenHeight * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(237, 237, 237, 1.0),
                            ),

                            child: TextFormField(
                              controller: signupController.repasswordController,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Dmsan_regular',
                              ),
                              decoration: InputDecoration(
                                hintText: 'Type your Re-password',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 196, 197, 196),
                                  fontFamily: 'Dmsan_regular',
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                isDense: true,
                              ),
                            ),
                          ),
                        ),

                        Container(height: 20,),

                        //edit name
                        Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text('Name', textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 12, 26, 48),
                                  fontFamily: 'arial',
                                  fontSize: screenWidth / 24,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.bold,
                                  height: 1
                              ),
                            )
                        ),

                        Container(height: 10,),

                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            width: screenWidth * 0.854,
                            height: screenHeight * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(237, 237, 237, 1.0),
                            ),

                            child: TextFormField(
                              controller: signupController.nameController,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Dmsan_regular',
                              ),
                              decoration: InputDecoration(
                                hintText: 'Type your name',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 196, 197, 196),
                                  fontFamily: 'Dmsan_regular',
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                isDense: true,
                              ),
                            ),
                          ),
                        ),

                        Container(height: 20,),

                        //edit code
                        Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text('Referral code', textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 12, 26, 48),
                                  fontFamily: 'arial',
                                  fontSize: screenWidth / 24,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.bold,
                                  height: 1
                              ),
                            )
                        ),

                        Container(height: 10,),

                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            width: screenWidth * 0.854,
                            height: screenHeight * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(237, 237, 237, 1.0),
                            ),

                            child: TextFormField(
                              controller: signupController.signupCodeController,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Dmsan_regular',
                              ),
                              decoration: InputDecoration(
                                hintText: 'Type referral code',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 196, 197, 196),
                                  fontFamily: 'Dmsan_regular',
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                isDense: true,
                              ),
                            ),
                          ),
                        ),

                        Container(height: 18,),

                        Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => SigninScreen()));
                              },
                              child: Text('Have a account? Sign in', textAlign: TextAlign.right, style: TextStyle(
                                  color: Color.fromRGBO(0, 99, 255, 1),
                                  fontFamily: 'DM Sans',
                                  fontSize: screenWidth / 26,
                                  fontWeight: FontWeight.normal,
                                  height: 1
                              ),
                              ),
                            )
                        ),



                        Container(height: 40,),

                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: ButtonType1(Height: 60 , Width: screenWidth * 0.418, color: Color.fromARGB(255, 1, 7, 104), radiusBorder: 4, title: "Sign up", fontText: 'Dmsan_regular', colorText: Colors.white,
                            onTap: (){
                            if (signupController.signupCodeController.text.isNotEmpty) {
                              if (signupController.signupCodeController.text.toString() == referralCode) {
                                signupController.signUpPressed();
                                setState(() {
                                  loading = signupController.loading;
                                });
                              } else {
                                toastMessage("Referral Code In-correct");
                              }
                            }
                            } , loading: loading,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onWillPop: () async {
          return false;
        }
    );
  }
}
