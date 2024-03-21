import 'dart:async';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ning_web/main_screens/Before_entering/Controller/LoginController.dart';
import 'package:ning_web/main_screens/Before_entering/home_screen.dart';
import 'package:ning_web/main_screens/MainmenuScreen/mainmenu.dart';

import '../../Screenwait/Screenwait.dart';
import '../signin_screen.dart';


class FirstLoading {
  void isLogin(BuildContext context, double width) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null){
      LoginController.getAccountData(user.email.toString());
      Timer(const Duration(seconds: 3) , () => Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => MainMenuScreen())));
    } else {
      if (width >= 600) {
        Timer(const Duration(seconds: 3) , () => Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => SigninScreen())));
      } else {
        Timer(const Duration(seconds: 3) , () => Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Screenwait())));
      }

    }
  }
}