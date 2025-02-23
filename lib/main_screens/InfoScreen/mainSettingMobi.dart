import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:ning_web/Button/Buttontype1.dart';
import 'package:ning_web/main_screens/Before_entering/first_loading_screen.dart';
import 'package:ning_web/main_screens/M%C3%A0n%20h%C3%ACnh%20chat/Data/chatRoom.dart';
import 'package:ning_web/main_screens/M%C3%A0n%20h%C3%ACnh%20chat/Data/messenger.dart';
import 'package:ning_web/main_screens/M%C3%A0n%20h%C3%ACnh%20chat/Screen/m%C3%A0n%20h%C3%ACnh%20chat.dart';
import 'package:ning_web/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Finalclass/finalclass.dart';
import '../ExitingorderScreen/exitingorderMobi.dart';
import '../IntroductionScreen/Mobile Intro.dart';
import '../VouvherScreen/MobiScreen.dart';
import '../Wallet/Mobiscreen/wallet.dart';
import '../changeLanguage/changeLanguage.dart';
import '../viewAccount/viewAccountMobi.dart';

class settingMobi extends StatefulWidget {
  const settingMobi({Key? key}) : super(key: key);

  @override
  State<settingMobi> createState() => _settingMobiState();
}

class _settingMobiState extends State<settingMobi> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;
  bool haveNotice = false;
  chatRoom room = chatRoom(account: currentAccount, messengerList: []);
  Future<void> getChatRoom() async {
    final reference = FirebaseDatabase.instance.reference();
    await reference.child("Chatrooms").child(currentAccount.id).onValue.listen((event) async {
      final dynamic Chatrooms = event.snapshot.value;
      if(Chatrooms != null) {
        room = chatRoom.fromJson(Chatrooms);
        await pushChatRooms(room);
      } else {
        room = chatRoom(account: currentAccount, messengerList: []);
        room.messengerList.add(messenger(type: 2, content: 'Xin chào, Destiny Asia giúp gì được cho bạn'));
        await pushChatRooms(room);
      }
    });
  }

  void getRoom() {
    final reference = FirebaseDatabase.instance.reference();
    reference.child("Chatrooms").child(currentAccount.id).onValue.listen((event) async {
      final dynamic Chatrooms = event.snapshot.value;
      if(Chatrooms != null) {
        room = chatRoom.fromJson(Chatrooms);
        if (room.messengerList.last.type == 2) {
          setState(() {
            haveNotice = true;
          });
        } else {
          setState(() {
            haveNotice = false;
          });
        }
      } else {
        setState(() {
          haveNotice = false;
        });
      }
    });
  }

  Future<void> pushChatRooms(chatRoom room) async {
    final reference = FirebaseDatabase.instance.reference();
    await reference.child("Chatrooms").child(currentAccount.id).set(room.toJson());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRoom();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String url = "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/account_no_img.png?alt=media&token=293d83fd-df2d-4182-a4fc-59b4ae4396de";
    if (currentAccount.avatarId.isNotEmpty) {
      url = currentAccount.avatarId;
    }

    return Container(
      decoration: BoxDecoration(
          color: Colors.white
      ),

      child: ListView(
        children: [
          Container(height: 20,),

          Padding(
            padding: EdgeInsets.only(left: (screenWidth - screenWidth/3)/2 , right: (screenWidth - screenWidth/3)/2),
            child: Container(
              height: screenWidth/3,
              width: screenWidth/3,
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
                  borderRadius: BorderRadius.circular(screenWidth/6),
              ),
            ),
          ),

          Container(height: 10,),

          Container(
            height: 36,
            width: screenWidth,
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
            width: screenWidth,
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
            child: ButtonType1(Height: 50, Width: screenWidth - 140, color: Colors.redAccent, radiusBorder: 30, title: "Edit profile", fontText: "arial", colorText: Colors.white,
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => viewAccMobi()));
                }),
          ),

          Container(height: 40,),

          //wallet
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => walletMobiScreen()));
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
                          borderRadius: BorderRadius.circular(250),
                          color: Colors.blue.withOpacity(0.2)
                        ),
                        child: Center(
                          child: Icon(
                            Icons.monetization_on_outlined,
                            size: 25,
                            color: Colors.blue,
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
                currentAccount.id = '';
                toastMessage("you delete account request will be sent, you can wait 6-7 days");
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
                          borderRadius: BorderRadius.circular(250),
                          color: Colors.red.withOpacity(0.2),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.logout_outlined,
                            size: 25,
                            color: Colors.red,
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

          //voucher
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: GestureDetector(
              onTap: () {
                voucherSelect.clear();
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => VoucherScreenMobi()));
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
                          borderRadius: BorderRadius.circular(250),
                          color: Colors.blue.withOpacity(0.2)
                        ),
                        child: Center(
                          child: Icon(
                            Icons.discount_outlined,
                            size: 25,
                            color: Colors.blue,
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
                voucherSelect.clear();
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => ExitingorderMobiScreen()));
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
                            borderRadius: BorderRadius.circular(250),
                            color: Colors.blue.withOpacity(0.2)
                        ),
                        child: Center(
                          child: Icon(
                            Icons.history_outlined,
                            size: 25,
                            color: Colors.blue,
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

          //Language
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(_) => changeLanguage()));
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
                            borderRadius: BorderRadius.circular(250),
                            color: Colors.blue.withOpacity(0.2)
                        ),
                        child: Center(
                          child: Icon(
                            Icons.language_outlined,
                            size: 25,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 18,
                      left: 70,
                      child: LocaleText(
                        "language",
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
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      insetPadding: EdgeInsets.zero,
                      contentPadding: EdgeInsets.zero,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      title: Text('Chọn phương thức hỗ trợ', style: TextStyle(fontFamily: 'roboto', color: Colors.black, fontSize: 16),),
                      content: Container(
                        width: screenWidth - 80,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(height: 15,),

                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: GestureDetector(
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.blueAccent.withOpacity(0.7)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.send,
                                            color: Colors.white,
                                          ),

                                          Container(width: 10,),

                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Telegram',
                                              style: TextStyle(
                                                fontFamily: 'roboto',
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  launch("https://t.me/Ningshop_help");
                                },
                              ),
                            ),

                            Container(height: 15,),

                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 15),
                              child: GestureDetector(
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.yellow.shade600
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 10),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          !loading ? Icon(
                                            Icons.chat_sharp,
                                            color: Colors.black,
                                          ) : CircularProgressIndicator(color: Colors.black,strokeWidth: 15,),

                                          Container(width: 10,),

                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Hỗ trợ trực tiếp',
                                              style: TextStyle(
                                                  fontFamily: 'roboto',
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () async {
                                  setState(() {
                                    loading = false;
                                  });
                                  await getChatRoom();
                                  setState(() {
                                    loading = false;
                                  });
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => chatRoomScreen(),),);
                                },
                              ),
                            ),

                            Container(height: 15,),
                          ],
                        ),
                      ),
                    );
                  },
                );
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
                            borderRadius: BorderRadius.circular(250),
                            color: Colors.blue.withOpacity(0.2)
                        ),
                        child: Center(
                          child: Icon(
                            Icons.support_agent,
                            size: 25,
                            color: Colors.blue,
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

                    Positioned(
                      top: 7,
                      left: 45,
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          color: haveNotice ? Colors.red : Colors.transparent,
                          borderRadius: BorderRadius.circular(100)
                        ),
                      ),
                    )
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => IntroductionMobi()));
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
                            borderRadius: BorderRadius.circular(250),
                            color: Colors.blue.withOpacity(0.2)
                        ),
                        child: Center(
                          child: Icon(
                            Icons.local_police_outlined,
                            size: 25,
                            color: Colors.blue,
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
                currentAccount.id = '';
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
                            borderRadius: BorderRadius.circular(250),
                            color: Colors.red.withOpacity(0.2)
                        ),
                        child: Center(
                          child: Icon(
                            Icons.login_sharp,
                            size: 25,
                            color: Colors.red,
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

          Container(height: 10,),
        ],
      ),
    );
  }
}
