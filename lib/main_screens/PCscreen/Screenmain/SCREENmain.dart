import 'package:flutter/material.dart';
import 'package:ning_web/Finalclass/finalclass.dart';
import 'package:ning_web/main_screens/PCscreen/PAGE/Mainpage.dart';
import 'package:ning_web/main_screens/PCscreen/PAGE/ViewallPage.dart';
import 'package:ning_web/main_screens/PCscreen/PAGE/cartPage.dart';

import '../PAGE/accountPage.dart';

class Screenmainpc extends StatefulWidget {
  const Screenmainpc({Key? key}) : super(key: key);

  @override
  State<Screenmainpc> createState() => _ScreenmainpcState();
}

class _ScreenmainpcState extends State<Screenmainpc> {
  int selectedIndex = 0;
  bool isHovered = false;
  bool isHovered1 = false;
  bool isHovered2 = false;
  bool isHovered3 = false;

  Widget getBodyWidget(double width, double height) {
    // Dựa vào selectedIndex, trả về phần body tương ứng
    switch (selectedIndex) {
      case 0:
        return Mainpage(width: width, height: height, type: 0,);
      case 1:
        return Viewallpage(width: width, height: height, productList: currentAccount.wishList);
      case 2:
        infoPay.money.value = 0;
        cartProduct.clear();
        return cartPage(width: width, height: height);
      case 3:
        return accountPage(width: width, height: height);
      default:
        return Container();
    }
  }

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

                //left navigator
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                      width: screenWidth/6,
                      height: screenHeight,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(219, 30, 30, 30)
                      ),

                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: screenWidth/6,
                              height: screenHeight/10,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 30, 30, 30)
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'NOW SHOPPING',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'logo_font_1',
                                    fontSize: screenWidth/50,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            top: screenHeight/10,
                            left: 0,
                            child: Container(
                              height: screenHeight - screenHeight/10,
                              width: screenWidth/6,
                              child: ListView(
                                children: [
                                  Container(
                                    height: 5,
                                  ),

                                  //btn trang chủ
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = 10;
                                      });
                                      Future.delayed(const Duration(milliseconds: 200), () {
                                        setState(() {
                                          selectedIndex = 0;
                                        });
                                      });
                                    },

                                    onTapDown: (details) {
                                      setState(() {
                                        isHovered = true;
                                      });
                                    },
                                    onTapUp: (details) {
                                      setState(() {
                                        isHovered = false;
                                      });
                                    },
                                    onTapCancel: () {
                                      setState(() {
                                        isHovered = false;
                                      });
                                    },
                                    child: Container(
                                      height: screenHeight/15,
                                      decoration: BoxDecoration(

                                      ),
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            child: Container(
                                              width: (4/5) * (screenWidth/6),
                                              height: screenHeight/15,
                                              alignment: Alignment.centerLeft,
                                              decoration: BoxDecoration(
                                                color : isHovered ? Colors.grey : null,
                                              ),
                                              child: Text(
                                                '   Trang chủ',
                                                style: TextStyle(
                                                    fontFamily: 'arial',
                                                    fontSize: screenWidth/90,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.normal
                                                ),
                                              ),
                                            ),
                                          ),

                                          Positioned(
                                            top: 0,
                                            right: 10,
                                            child: Container(
                                              width: (1/20) * (screenWidth/6),
                                              height: screenHeight/15,
                                              alignment: Alignment.centerLeft,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.fitWidth,
                                                      image: AssetImage('assets/righticon.png')
                                                  )
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(left: 10, right: 10),
                                    child: Container(
                                      height: 1,
                                      decoration: BoxDecoration(
                                          color: Colors.white
                                      ),
                                    ),
                                  ),

                                  Container(
                                    height: 5,
                                  ),

                                  //btn Yêu thích
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = 10;
                                      });
                                      Future.delayed(const Duration(milliseconds: 200), () {
                                        setState(() {
                                          selectedIndex = 1;
                                        });
                                      });
                                    },
                                    onTapDown: (details) {
                                      setState(() {
                                        isHovered1 = true;
                                      });
                                    },
                                    onTapUp: (details) {
                                      setState(() {
                                        isHovered1 = false;
                                      });
                                    },
                                    onTapCancel: () {
                                      setState(() {
                                        isHovered1 = false;
                                      });
                                    },
                                    child: Container(
                                      height: screenHeight/15,
                                      decoration: BoxDecoration(

                                      ),
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            child: Container(
                                              width: (4/5) * (screenWidth/6),
                                              height: screenHeight/15,
                                              alignment: Alignment.centerLeft,
                                              decoration: BoxDecoration(
                                                color : isHovered1 ? Colors.grey : null,
                                              ),
                                              child: Text(
                                                '   Yêu thích',
                                                style: TextStyle(
                                                    fontFamily: 'arial',
                                                    fontSize: screenWidth/90,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.normal
                                                ),
                                              ),
                                            ),
                                          ),

                                          Positioned(
                                            top: 0,
                                            right: 10,
                                            child: Container(
                                              width: (1/20) * (screenWidth/6),
                                              height: screenHeight/15,
                                              alignment: Alignment.centerLeft,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.fitWidth,
                                                      image: AssetImage('assets/righticon.png')
                                                  )
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(left: 10, right: 10),
                                    child: Container(
                                      height: 1,
                                      decoration: BoxDecoration(
                                          color: Colors.white
                                      ),
                                    ),
                                  ),

                                  Container(
                                    height: 5,
                                  ),

                                  //btn giỏ hàng
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = 10;
                                      });
                                      Future.delayed(const Duration(milliseconds: 200), () {
                                        setState(() {
                                          selectedIndex = 2;
                                        });
                                      });
                                    },

                                    onTapDown: (details) {
                                      setState(() {
                                        isHovered2 = true;
                                      });
                                    },
                                    onTapUp: (details) {
                                      setState(() {
                                        isHovered2 = false;
                                      });
                                    },
                                    onTapCancel: () {
                                      setState(() {
                                        isHovered2 = false;
                                      });
                                    },
                                    child: Container(
                                      height: screenHeight/15,
                                      decoration: BoxDecoration(
                                        color : isHovered2 ? Colors.grey : null,
                                      ),
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            child: Container(
                                              width: (4/5) * (screenWidth/6),
                                              height: screenHeight/15,
                                              alignment: Alignment.centerLeft,
                                              decoration: BoxDecoration(

                                              ),
                                              child: Text(
                                                '   Giỏ hàng',
                                                style: TextStyle(
                                                    fontFamily: 'arial',
                                                    fontSize: screenWidth/90,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.normal
                                                ),
                                              ),
                                            ),
                                          ),

                                          Positioned(
                                            top: 0,
                                            right: 10,
                                            child: Container(
                                              width: (1/20) * (screenWidth/6),
                                              height: screenHeight/15,
                                              alignment: Alignment.centerLeft,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.fitWidth,
                                                      image: AssetImage('assets/righticon.png')
                                                  )
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(left: 10, right: 10),
                                    child: Container(
                                      height: 1,
                                      decoration: BoxDecoration(
                                          color: Colors.white
                                      ),
                                    ),
                                  ),

                                  Container(
                                    height: 5,
                                  ),

                                  //btn tai khoan
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = 10;
                                      });
                                      Future.delayed(const Duration(milliseconds: 200), () {
                                        setState(() {
                                          selectedIndex = 3;
                                        });
                                      });
                                    },

                                    onTapDown: (details) {
                                      setState(() {
                                        isHovered3 = true;
                                      });
                                    },
                                    onTapUp: (details) {
                                      setState(() {
                                        isHovered3 = false;
                                      });
                                    },
                                    onTapCancel: () {
                                      setState(() {
                                        isHovered3 = false;
                                      });
                                    },
                                    child: Container(
                                      height: screenHeight/15,
                                      decoration: BoxDecoration(

                                      ),
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            child: Container(
                                              width: (4/5) * (screenWidth/6),
                                              height: screenHeight/15,
                                              alignment: Alignment.centerLeft,
                                              decoration: BoxDecoration(
                                                color : isHovered3 ? Colors.grey : null,
                                              ),
                                              child: Text(
                                                '   Tài khoản',
                                                style: TextStyle(
                                                    fontFamily: 'arial',
                                                    fontSize: screenWidth/90,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.normal
                                                ),
                                              ),
                                            ),
                                          ),

                                          Positioned(
                                            top: 0,
                                            right: 10,
                                            child: Container(
                                              width: (1/20) * (screenWidth/6),
                                              height: screenHeight/15,
                                              alignment: Alignment.centerLeft,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      fit: BoxFit.fitWidth,
                                                      image: AssetImage('assets/righticon.png')
                                                  )
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(left: 10, right: 10),
                                    child: Container(
                                      height: 1,
                                      decoration: BoxDecoration(
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                ),

                //center navigator
                Positioned(
                  top: 10,
                  left: screenWidth/6 + 20,
                  child: Container(
                    height: screenHeight,
                    width: screenWidth - screenWidth/6 - 30,
                    decoration: BoxDecoration(
                        color: Colors.white
                    ),

                    child: Scaffold(
                      body: getBodyWidget(screenWidth - screenWidth/6 - 30, screenHeight),
                    ),
                  ),
                )

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
