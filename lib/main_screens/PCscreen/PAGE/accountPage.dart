import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:ning_web/Button/Buttontype1.dart';
import 'package:ning_web/main_screens/Before_entering/first_loading_screen.dart';
import 'package:ning_web/main_screens/PCscreen/PAGE/accountdetailPage.dart';
import 'package:ning_web/main_screens/PCscreen/PAGE/existingorderPage.dart';
import 'package:ning_web/main_screens/PCscreen/PAGE/voucherPage.dart';
import 'package:ning_web/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Finalclass/finalclass.dart';
import '../../ExitingorderScreen/exitingorderMobi.dart';
import '../../IntroductionScreen/Mobile Intro.dart';
import '../../VouvherScreen/MobiScreen.dart';
import '../../Wallet/Mobiscreen/wallet.dart';
import '../../changeLanguage/changeLanguage.dart';
import '../../viewAccount/viewAccountMobi.dart';
import 'Walletpage.dart';
import 'intropage.dart';

class accountPage extends StatefulWidget {
  final double width;
  final double height;
  const accountPage({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  State<accountPage> createState() => _accountPageState();
}

class _accountPageState extends State<accountPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String url = "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/account_no_img.png?alt=media&token=293d83fd-df2d-4182-a4fc-59b4ae4396de";
  int selectIndex = 0;

  Widget getBodywidget(double width, double height) {
    switch(selectIndex) {
      case 0 :
        return Container(
          decoration: BoxDecoration(
              color: Colors.white
          ),

          child: ListView(
            children: [
              Container(height: 20,),

              Padding(
                padding: EdgeInsets.only(left: (widget.width - widget.width/6)/2 , right: (widget.width - widget.width/6)/2),
                child: Container(
                  height: widget.width/6,
                  width: widget.width/6,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2), // màu của shadow
                        spreadRadius: 5, // bán kính của shadow
                        blurRadius: 7, // độ mờ của shadow
                        offset: Offset(0, 3), // vị trí của shadow
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(url),
                    ),
                    borderRadius: BorderRadius.circular(widget.width/6),
                  ),
                ),
              ),

              Container(height: 10,),

              Container(
                height: 36,
                width: widget.width,
                alignment: Alignment.topCenter,
                child: Text(
                  currentAccount.name,
                  style: TextStyle(
                      fontFamily: 'Dmsan_regular',
                      color: Colors.black,
                      fontSize: 24,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),

              Container(
                height: 36,
                width: widget.width,
                alignment: Alignment.topCenter,
                child: Text(
                  currentAccount.username,
                  style: TextStyle(
                      fontFamily: 'arial',
                      color: Colors.black,
                      fontSize: 16,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal
                  ),
                ),
              ),

              //edit account
              Padding(
                padding: EdgeInsets.only(left: 70,right: 70),
                child: ButtonType1(Height: 60, Width: widget.width - 140, color: Colors.redAccent, radiusBorder: 30, title: "Edit profile", fontText: "arial", colorText: Colors.white,
                    onTap: () {
                      selectIndex = 1;
                      setState(() {

                      });
                    }),
              ),

              Container(height: 40,),

              //wallet
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  onTap: () {
                    selectIndex = 3;
                    setState(() {

                    });
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      border: Border.all(
                        width: 1,
                        color: Color.fromARGB(255, 228, 226, 250),
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 5,
                          left: 5,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/icons/walleticon.png"),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 18,
                          left: 70,
                          child: LocaleText(
                            "mywallet",
                            style: TextStyle(
                              fontFamily: 'arial',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(height: 10,),

              //delete account
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  onTap: () async {
                    await _auth.signOut();
                    toastMessage("you delete account request will be sent, you can wait 6-7 days");
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstLoad()),);
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      border: Border.all(
                        width: 1,
                        color: Color.fromARGB(255, 228, 226, 250),
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 5,
                          left: 5,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/icons/logouticon.png"),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 18,
                          left: 70,
                          child: Text(
                            "Delete account",
                            style: TextStyle(
                              fontFamily: 'arial',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


              Container(height: 10,),

              //Support
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  onTap: () {
                    launch("https://t.me/Ningshop_help");
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      border: Border.all(
                        width: 1,
                        color: Color.fromARGB(255, 228, 226, 250),
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 5,
                          left: 5,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/icons/supporticon.png"),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 18,
                          left: 70,
                          child: LocaleText(
                            "support",
                            style: TextStyle(
                              fontFamily: 'arial',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),


              Container(height: 10,),

              //voucher
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  onTap: () {
                    selectIndex = 4;
                    setState(() {

                    });
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      border: Border.all(
                        width: 1,
                        color: Color.fromARGB(255, 228, 226, 250),
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 5,
                          left: 5,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/icons/voucherclicon.png"),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 18,
                          left: 70,
                          child: LocaleText(
                            "myvoucher",
                            style: TextStyle(
                              fontFamily: 'arial',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(height: 10,),

              //Exiting order
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  onTap: () {
                    selectIndex = 5;
                    setState(() {

                    });
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      border: Border.all(
                        width: 1,
                        color: Color.fromARGB(255, 228, 226, 250),
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 5,
                          left: 5,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/icons/orderhistoryic.png"),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 18,
                          left: 70,
                          child: LocaleText(
                            "exitingorder",
                            style: TextStyle(
                              fontFamily: 'arial',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(height: 10,),

              //intro
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  onTap: () {
                    selectIndex = 2;
                    setState(() {

                    });
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      border: Border.all(
                        width: 1,
                        color: Color.fromARGB(255, 228, 226, 250),
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 5,
                          left: 5,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/icons/introicon.png"),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 18,
                          left: 70,
                          child: LocaleText(
                            "intro",
                            style: TextStyle(
                              fontFamily: 'arial',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(height: 10,),

              //Logout
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: GestureDetector(
                  onTap: () async {
                    await _auth.signOut();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstLoad()));
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      border: Border.all(
                        width: 1,
                        color: Colors.redAccent,
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 5,
                          left: 5,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/icons/logouticon.png"),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 18,
                          left: 70,
                          child: LocaleText(
                            "logout",
                            style: TextStyle(
                              fontFamily: 'arial',
                              color: Colors.redAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Container(height: 90,),
            ],
          ),
        );
      case 1 :
        return accountdetailPage(width: width, height: height);
      case 2 :
        return introPage(width: width, height: height);
      case 3 :
        return walletPagePC(width: width, height: height);
      case 4 :
        return voucherPage(width: width, height: height);
      case 5 :
        return existingOrderPage(width: width, height: height);
      default:
        return Container();
    }
  }
  @override
  Widget build(BuildContext context) {
    if (currentAccount.avatarId.isNotEmpty) {
      url = currentAccount.avatarId;
    }
    return Scaffold(
      body: getBodywidget(widget.width, widget.height),
    );
  }
}
