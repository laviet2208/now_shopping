import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ning_web/main_screens/M%C3%A0n%20h%C3%ACnh%20chat/Data/chatRoom.dart';
import 'package:ning_web/main_screens/M%C3%A0n%20h%C3%ACnh%20chat/Data/messenger.dart';
import 'package:ning_web/main_screens/M%C3%A0n%20h%C3%ACnh%20chat/Screen/Item_messenger.dart';
import 'package:ning_web/main_screens/MainmenuScreen/mainMenuMobi.dart';
import 'package:ning_web/main_screens/MainmenuScreen/mainmenu.dart';

import '../../../Finalclass/finalclass.dart';

class chatRoomScreen extends StatefulWidget {
  const chatRoomScreen({Key? key}) : super(key: key);

  @override
  State<chatRoomScreen> createState() => _chatRoomScreenState();
}

class _chatRoomScreenState extends State<chatRoomScreen> {
  chatRoom room = chatRoom(account: currentAccount, messengerList: []);
  bool Loading = false;
  void getChatRoom() {
    final reference = FirebaseDatabase.instance.reference();
    reference.child("Chatrooms").child(currentAccount.id).onValue.listen((event) async {
      final dynamic Chatrooms = event.snapshot.value;
      if(Chatrooms != null) {
        room = chatRoom.fromJson(Chatrooms);
        setState(() {

        });
      } else {
        room = chatRoom(account: currentAccount, messengerList: []);
        room.messengerList.add(messenger(type: 2, content: 'Xin chào, Destiny Asia giúp gì được cho bạn'));
        pushChatRooms(room);
        setState(() {

        });
      }
    });
  }

  Future<void> pushChatRooms(chatRoom room) async {
    final reference = FirebaseDatabase.instance.reference();
    await reference.child("Chatrooms").child(currentAccount.id).set(room.toJson());
  }

  final messengerText = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getChatRoom();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.pinkAccent,),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MainMenuScreen(),),);
            },
          ),
          title: Row(
            children: [
              Image.asset(
                'assets/logo_1.png',
                width: screenWidth/7.84,
                height: screenWidth/7.84,
              ),

              SizedBox(width: 10),

              Text(
                'Destiny Asia',
                style: TextStyle(
                  fontFamily: "logo_font_1",
                  fontSize: screenWidth/19.65,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 7, 104),
                ),
              ),

              SizedBox(width: 5),

              Text(
                'SUPPORT',
                style: TextStyle(
                  fontFamily: "logo_font_1",
                  fontSize: screenWidth/19.65,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent,
                ),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 1,
                        color: Colors.grey.withOpacity(0.5)
                      )
                    )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 20,
                        bottom: 20,
                        right: 5,
                        child: GestureDetector(
                          child: Container(
                            width: 40,
                            child:!Loading ? Icon(
                              Icons.send,
                              color: messengerText.text.isNotEmpty ? Colors.blue : Colors.grey,
                            ) : CircularProgressIndicator(color: Colors.blue,),
                          ),
                          onTap: () async {
                            if (messengerText.text.isNotEmpty) {
                              messenger mes = messenger(type: 1, content: messengerText.text.toString());
                              room.messengerList.add(mes);
                              setState(() {
                                Loading = true;
                              });
                              await pushChatRooms(room);

                              setState(() {
                                Loading = false;
                                messengerText.clear();
                              });
                            }
                          },
                        )
                      ),

                      Positioned(
                        top: 20,
                        bottom: 20,
                        left: 10,
                        right: 70,
                        child: Container(
                          child: TextFormField(
                            controller: messengerText,
                            onChanged: (newValue) {
                              setState(() {

                              });
                            },
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'roboto',
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.message_outlined),
                              hintText: 'Nhập tin nhắn ở đây',
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontFamily: 'roboto',
                              ),
                              border: InputBorder.none,
                              isDense: true,
                              //Xóa contentVerticalAlignment trong InputDecoration
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Positioned(
                top: 10,
                bottom: 85,
                left: 10,
                right: 10,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: room.messengerList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Item_messenger(mes: room.messengerList[index]),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
