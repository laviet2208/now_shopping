import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ning_web/Button/Buttontype2.dart';
import 'package:ning_web/Finalclass/finalclass.dart';
import 'package:ning_web/main_screens/VouvherScreen/Screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../Before_entering/first_loading_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double baseWidth = 1920;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.9;

    String url = "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/account_no_img.png?alt=media&token=293d83fd-df2d-4182-a4fc-59b4ae4396de";
    if (currentAccount.avatarId.isNotEmpty) {
      url = currentAccount.avatarId;
    }

    void _openNewTab() async {
      const url = 'https://t.me/Ningshop_help'; // Đặt URL muốn mở ở đây

      if (await canLaunch(url)) {
        await launch(url, forceSafariVC: false, forceWebView: false);
      } else {
        throw 'Không thể mở URL: $url';
      }
    }

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration (
          color: Color(0xfff5f5f5),
        ),

        child: Stack(
          children: <Widget>[
            Positioned(
                top: screenHeight/10,
                left: 0,
                child: Container(
                  width:  screenWidth,
                  height:  screenHeight - screenHeight/10,
                  decoration: BoxDecoration(

                  ),

                  child: Stack(
                    children: <Widget>[
                      //Ảnh đại diện
                      Positioned(
                        top: 10,
                        left: (screenWidth - screenHeight/4)/2,
                        child: Container(
                          height: screenHeight/4,
                          width: screenHeight/4,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(url),
                              ),
                              borderRadius: BorderRadius.circular(screenHeight/8),
                              border: Border.all(
                                width: 2,
                                color: Color(0xff3669c9),
                              )
                          ),
                        ),
                      ),

                      //Email người dùng
                      Positioned(
                        top: 10 + screenHeight/4,
                        left: 0,
                        child: Container(
                          height: screenHeight/10,
                          width: screenWidth,
                          alignment: Alignment.center,

                          child: Text(
                            currentAccount.username,
                            style: TextStyle(
                              fontFamily: 'Dmsan_regular',
                              fontSize: 30*ffem,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              color: Color(0xff3669c9),
                            ),
                          ),
                        ),
                      ),
                      
                      //Nút Account
                      Positioned(
                        top: 10 + screenHeight/4 + screenHeight/10 + 20,
                        left: screenWidth/4.5,
                        child: Container(
                          height: screenHeight/10,
                          width: screenWidth/4,
                          child: ButtonType2(Height: screenHeight/11, Width: screenHeight/4, radiusBorder: 20, title: "My Account", fontText: 'Dmsan_regular', colorText: Color(0xff3669c9), BackGroundColor: Colors.white, StrokeColor: Color(0xff3669c9),
                              onTap:() {},
                              url: "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2Fbtn_acc_icon.png?alt=media&token=5591f6ca-8bb7-4156-8860-762cc8f47aac")
                        ),
                      ),

                      //Nút Order
                      Positioned(
                        top: 10 + screenHeight/4 + screenHeight/10 + 20 + screenHeight/11 + 20,
                        left: screenWidth/4.5,
                        child: Container(
                            height: screenHeight/10,
                            width: screenWidth/4,
                            child: ButtonType2(Height: screenHeight/11, Width: screenHeight/4, radiusBorder: 20, title: "Order History", fontText: 'Dmsan_regular', colorText: Color(0xff3669c9), BackGroundColor: Colors.white, StrokeColor: Color(0xff3669c9),
                                onTap:() {},
                                url: "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2Fbtn_order_icon.png?alt=media&token=a6b7f361-4e03-4aa6-8489-90d28165f197")
                        ),
                      ),

                      //Nút ngôn ngữ
                      Positioned(
                        top: 10 + screenHeight/4 + screenHeight/10 + 20 + screenHeight/11 + 20 + screenHeight/11 + 20,
                        left: screenWidth/4.5,
                        child: Container(
                            height: screenHeight/10,
                            width: screenWidth/4,
                            child: ButtonType2(Height: screenHeight/11, Width: screenHeight/4, radiusBorder: 20, title: "Change Language", fontText: 'Dmsan_regular', colorText: Color(0xff3669c9), BackGroundColor: Colors.white, StrokeColor: Color(0xff3669c9),
                              onTap:() {},
                              url: "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2Flanguage_icon.png?alt=media&token=d02eb31d-4786-46f1-a854-83c9927f86fc"),
                        ),
                      ),

                      //Nút Chăm sóc khách hàng
                      Positioned(
                        top: 10 + screenHeight/4 + screenHeight/10 + 20,
                        right: screenWidth/4.5,
                        child: Container(
                            height: screenHeight/10,
                            width: screenWidth/4,
                            child: ButtonType2(Height: screenHeight/11, Width: screenHeight/4, radiusBorder: 20, title: "Customer Care", fontText: 'Dmsan_regular', colorText: Color(0xff3669c9), BackGroundColor: Colors.white, StrokeColor: Color(0xff3669c9),
                                onTap:() {
                                  _openNewTab();
                                },
                                url: "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2Ftelephone.png?alt=media&token=f6fb8969-1e86-484d-a911-2940d1aaafce")
                        ),
                      ),

                      //Nút Ví tiền
                      Positioned(
                        top: 10 + screenHeight/4 + screenHeight/10 + 20 + screenHeight/11 + 20,
                        right: screenWidth/4.5,
                        child: Container(
                            height: screenHeight/10,
                            width: screenWidth/4,
                            child: ButtonType2(Height: screenHeight/11, Width: screenHeight/4, radiusBorder: 20, title: "My Wallet", fontText: 'Dmsan_regular', colorText: Color(0xff3669c9), BackGroundColor: Colors.white, StrokeColor: Color(0xff3669c9),
                                onTap:() {},
                                url: "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2Fwallet_ic.png?alt=media&token=5a6a503d-8a68-4058-ab58-4bca9dd1cd64")
                        ),
                      ),

                      //Nút voucher
                      Positioned(
                        top: 10 + screenHeight/4 + screenHeight/10 + 20 + screenHeight/11 + 20 + screenHeight/11 + 20,
                        right: screenWidth/4.5,
                        child: Container(
                          height: screenHeight/10,
                          width: screenWidth/4,
                          child: ButtonType2(Height: screenHeight/11, Width: screenHeight/4, radiusBorder: 20, title: "My Voucher", fontText: 'Dmsan_regular', colorText: Color(0xff3669c9), BackGroundColor: Colors.white, StrokeColor: Color(0xff3669c9),
                              onTap:() {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => VoucherScreen()));
                              },
                              url: "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2Fvoucher_ic.png?alt=media&token=85f489e3-a623-47d8-aa46-e7c6be5e06af"),
                        ),
                      ),

                      //Nút đăng xuất
                      Positioned(
                        top: 10 + screenHeight/4 + screenHeight/10 + 20 + screenHeight/11 + 20 + screenHeight/11 + 20 + screenHeight/11 + 20,
                        right: screenWidth/4.5,
                        child: Container(
                          height: screenHeight/10,
                          width: screenWidth/4,
                          child: ButtonType2(Height: screenHeight/11, Width: screenHeight/4, radiusBorder: 20, title: "Log out", fontText: 'Dmsan_regular', colorText: Color(0xff3669c9), BackGroundColor: Colors.white, StrokeColor: Color(0xff3669c9),
                              onTap:() async {
                                await _auth.signOut();
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FirstLoad()),);
                              },
                              url: "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2Flogout.png?alt=media&token=7a2c7f20-089f-408c-94d0-e3932264a121"),
                        ),
                      ),

                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
