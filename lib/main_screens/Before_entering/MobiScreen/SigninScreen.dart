import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:ning_web/Button/Buttontype1.dart';
import 'package:ning_web/main_screens/Before_entering/Controller/LoginController.dart';
import 'package:ning_web/main_screens/Before_entering/signup_screen.dart';
import 'package:ning_web/main_screens/MainmenuScreen/mainmenu.dart';
import 'package:ning_web/utils/utils.dart';

import '../home_screen.dart';


class SigninMobi extends StatefulWidget {
  const SigninMobi({Key? key}) : super(key: key);

  @override
  State<SigninMobi> createState() => _SigninMobiState();
}

class _SigninMobiState extends State<SigninMobi> {
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 60,
                  left: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => HomeScreen()));
                    },
                    child: Container(
                      width: screenWidth/15,
                      height: screenWidth/15,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/lefticon.png')
                          )
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 60 + screenWidth/15,
                  left: 0,
                  child: Container(
                      width: screenWidth,
                      height: screenHeight,
                      decoration: BoxDecoration(
                        color : Colors.white,
                      ),

                      child: ListView(
                        children: [
                          Container(height: 20,),

                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            // child: Text(
                            //   'WELCOME BACK TO DESTINY ASIA',
                            //   style: TextStyle(
                            //     fontFamily: 'logo_font_1',
                            //     fontSize: 24,
                            //     color: Colors.black,
                            //     fontWeight: FontWeight.bold
                            //   ),
                            // ),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle (
                                  fontFamily: 'logo_font_1',
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'WELCOME BACK TO\n',
                                  ),
                                  TextSpan(
                                    text: 'DESTINY ASIA',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 1, 7, 104),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Container(height: 70,),

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

                          Container(height: 20,),

                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              width: screenWidth * 0.854,
                              height: screenHeight * 0.07,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(237, 237, 237, 1.0),
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
                          ),

                          Container(height: 30,),

                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Password',
                                textAlign: TextAlign.left,
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

                          Container(height: 20,),

                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              width: screenWidth * 0.854,
                              height: screenHeight * 0.07,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(237, 237, 237, 1.0),
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
                                      color: Color.fromARGB(255, 196, 197, 196),
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

                          // Container(height: 15,),
                          //
                          // Padding(
                          //     padding: EdgeInsets.only(right: 10),
                          //     child: Text('Forgot Password ?', textAlign: TextAlign.right, style: TextStyle(
                          //         color: Color.fromRGBO(0, 99, 255, 1),
                          //         fontFamily: 'DM Sans',
                          //         fontSize: screenWidth / 28,
                          //         fontWeight: FontWeight.normal,
                          //         height: 1
                          //     ),)
                          // ),

                          Container(height: 50,),

                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: GestureDetector(
                              onTap: (){
                                if (formKey.currentState!.validate() && emailKey.currentState!.validate()) {
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
                              },
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 1, 7, 104),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'DM Sans',
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Container(height: 20,),

                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => SignUpScreen()));
                              },
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    width: 2,
                                    color: Color.fromARGB(255, 1, 7, 104),
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 1, 7, 104),
                                    fontSize: 14,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
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
