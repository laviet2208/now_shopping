import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ning_web/General/Account/Account.dart';
import 'package:ning_web/General/Tool/GenerateID.dart';
import 'package:ning_web/main_screens/Before_entering/signin_screen.dart';
import 'package:ning_web/utils/utils.dart';


class SignupController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  TextEditingController signupCodeController = TextEditingController();
  late BuildContext context;
  bool loading = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  void signUpPressed() {
    loading = true;
    if (nameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty || repasswordController.text.isEmpty ) {
      toastMessage("please fill yourInformation");
      loading = false;
    } else {
      auth.createUserWithEmailAndPassword(email: emailController.text.toString(), password: passwordController.text.toString()).then((value) {
        auth.currentUser?.sendEmailVerification().then((value) {
          String id = generateID(9);
          DatabaseReference database = FirebaseDatabase.instance.ref("Account");
          Account acc = Account(id: id, username: emailController.text.toString(), password: passwordController.text.toString(), name: nameController.text.toString(), totalMoney: 0.0,avatarId: "");
          database.child(id).set(acc.toJson()).then((value){
                loading = false;
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => SigninScreen()));
          }).onError((error, stackTrace) {
            toastMessage(error.toString());
            print(error.toString());
            loading = false;
          });
        }).catchError((error) {
          toastMessage(error.toString());
          print(error.toString());
          loading = false;
        });
      }).catchError((error) {
        loading = false;
        toastMessage(error.toString());
        print(error.toString());
      });
    }
  }
}