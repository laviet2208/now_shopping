import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ning_web/General/Product/Product.dart';
import 'package:ning_web/General/Tool/ChangeNumber.dart';
import 'package:ning_web/General/Tool/Compact.dart';
import 'package:ning_web/main_screens/CartScreen/screen.dart';
import 'package:ning_web/main_screens/InfoScreen/mainSetting.dart';
import 'package:ning_web/main_screens/Item/productItem/ProductViewItem.dart';
import 'package:ning_web/main_screens/MainmenuScreen/mainMenuMobi.dart';
import 'package:ning_web/main_screens/ProductDetailsScreen/productDetailScreen.dart';
import 'package:ning_web/main_screens/WishListScreen/Screen.dart';

import '../PCscreen/Screenmain/SCREENmain.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  bool isDataLoaded = false;
  List<Product> dataFearture = [];
  List<Product> dataFlashSale = [];
  List<Product> dataFiveStar = [];
  final databaseReference = FirebaseDatabase.instance.reference();

  void getFeaturedData() {
    final reference = FirebaseDatabase.instance.reference();
    reference.child("product").onValue.listen((event) {
      final dynamic product = event.snapshot.value;
      if (product != null && product is Map<String, dynamic>) {
        product.forEach((key, value) {
          Map<String, dynamic> product2 = value as Map<String, dynamic>;
          Product setPro = Product.fromJson(product2);
          dataFearture.add(setPro);
          if (setPro.isSale) {
            dataFlashSale.add(setPro);
          }
          if (countRatedb(setPro.evaluateList) == 5) {
            dataFiveStar.add(setPro);
          }
        });
        setState(() {});
      }
    });
  }


  @override
  void initState() {
    super.initState();
    getFeaturedData();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double baseWidth = 1920;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    if (screenWidth < 850) {
      return MainmenuMobi();
    }

    if (screenWidth >= 850) {
      return Screenmainpc();
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration (
              color: Color(0xfff5f5f5),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  offset: Offset(0*fem, 4*fem),
                  blurRadius: 2*fem,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(32*fem, 24*fem, 39*fem, 21*fem),
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 33*fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin:  EdgeInsets.fromLTRB(0*fem, 50*fem, 33*fem, 19*fem),

                              child: Text(
                                'Destiny Asia',
                                style: TextStyle (
                                  fontFamily: 'Dmsan_regular',
                                  fontSize: 80*ffem,
                                  height: 0.225*ffem/fem,
                                  decoration: TextDecoration.none,
                                  color: Color.fromARGB(255, 1, 7, 104),
                                ),
                              ),
                            ),

                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16*fem),
                                child: Material(
                                  borderRadius: BorderRadius.circular(37*fem),
                                  elevation: 1,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Search anything in Ning',
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 16*fem),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //Các ADS và icon
                      Container(
                        // autogrouptbkvBaW (DLqgBNdNepgspQCemFTBKV)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 92*fem, 0*fem),
                        height: 262*fem,
                        //Các ADS
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            //ADS số 1
                            Container(
                              // adsnocontent1W6z (1:4)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 20*fem, 0.1*fem),
                              width: 550*fem,
                              height: 261.9*fem,
                              child: Image.asset(
                                'assets/mainMenuIcon/ads_no_content.png',
                                fit: BoxFit.cover,
                              ),
                            ),


                            Container(
                              // autogroupdmhh1Je (DLqgXXiTKsa5QJxcAvdmHh)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 97*fem, 0*fem),
                              width: 687*fem,
                              height: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  //ADS số 2 và 3
                                  Container(
                                    // autogroup1d51vRc (DLqgkrfajJ1JLNCosz1d51)
                                    margin: EdgeInsets.fromLTRB(2*fem, 0*fem, 0*fem, 24.86*fem),
                                    width: double.infinity,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        //ADS số 2
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 25*fem, 0*fem),
                                          width: 330*fem,
                                          height: 157.14*fem,
                                          child: Image.asset(
                                            'assets/mainMenuIcon/ads_no_content.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),

                                        //ADS số 3
                                        Container(
                                          // adsnocontent3ZUa (1:6)
                                          width: 330*fem,
                                          height: 157.14*fem,
                                          child: Image.asset(
                                            'assets/mainMenuIcon/ads_no_content.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),


                                  // các mục sản phẩm
                                  Container(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        //Phần food
                                        Container(
                                          // iconfoodeF8 (1:34)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15*fem, 0*fem),
                                          width: 80*fem,
                                          height: 80*fem,
                                          child: Image.asset(
                                            'assets/mainMenuIcon/icon_food.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),

                                        //Phần technology
                                        Container(
                                          // icontechnologyXpi (1:31)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                                          width: 80*fem,
                                          height: 80*fem,
                                          child: Image.asset(
                                            'assets/mainMenuIcon/icon_technology.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),

                                        //Phần fashion
                                        Container(
                                          // iconfashionTCa (1:33)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15*fem, 0*fem),
                                          width: 80*fem,
                                          height: 80*fem,
                                          child: Image.asset(
                                            'assets/mainMenuIcon/icon_fashion.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),

                                        //Phần saleup
                                        Container(
                                          // iconsaleupNaS (1:36)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15*fem, 0*fem),
                                          width: 80*fem,
                                          height: 80*fem,
                                          child: Image.asset(
                                            'assets/mainMenuIcon/icon_saleup.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),

                                        //Phần present
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15*fem, 0*fem),
                                          width: 80*fem,
                                          height: 80*fem,
                                          child: Image.asset(
                                            'assets/mainMenuIcon/icon_gift.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //Flashsale
                            Container(
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 100*fem),
                              constraints: BoxConstraints (
                                maxWidth: MediaQuery.of(context).size.width / 3,
                              ),
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle (
                                    fontFamily: 'Dmsan_regular',
                                    fontSize: 40*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 0.5*ffem/fem,
                                    color: Color(0xffff8900),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Flash sale : Coming',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: screenWidth/1.28,
                  height: 530 * fem,
                  decoration: BoxDecoration(

                  ),

                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width:  screenWidth/1.28,
                          height:  530 * fem ,

                          child: ListView(
                            children: [
                              Container(
                                width: screenWidth/1.28,
                                height: screenHeight/50,
                              ),

                              Container(
                                height: screenHeight/20,
                                alignment: Alignment.center, // canh giữa theo chiều dọc và ngang
                                decoration: BoxDecoration (
                                  color: Colors.white,
                                ),

                                child: Text(
                                  "DAILY DISCOVER",
                                  style: TextStyle(
                                      color: Color(0xffff0000),
                                      fontFamily: 'Dmsan_regular',
                                      fontSize: screenWidth/76.8,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),

                              Container(
                                height: 2,
                                decoration: BoxDecoration (
                                  color: Color(0xffff0000),
                                ),
                              ),

                              Container(
                                width: screenWidth/1.28,
                                height: screenHeight/50,
                              ),

                              Container(
                                  height: ((screenWidth/1.28/6)/2 * 3 + screenHeight/50) * getLine(dataFearture.length, 6),
                                  decoration: BoxDecoration(

                                  ),
                                  child: GridView.builder(
                                    itemCount: dataFearture.length,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 6, // số phần tử trên mỗi hàng
                                      mainAxisSpacing: 0, // khoảng cách giữa các hàng
                                      crossAxisSpacing: 5, // khoảng cách giữa các cột
                                      childAspectRatio: 2/3, // tỷ lệ chiều rộng và chiều cao
                                    ),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => proDuctDetailScreen(product: dataFearture[index])));
                                          },
                                          child: ProductItemWidget(product: dataFearture[index], width: screenWidth/1.28, height: screenHeight),
                                        ),
                                      );
                                    },
                                  )
                              ),


                              Container(
                                width: screenWidth/1.28,
                                height: screenHeight/50,
                              ),

                              Container(
                                height: screenHeight/20,
                                alignment: Alignment.center, // canh giữa theo chiều dọc và ngang
                                decoration: BoxDecoration (
                                  color: Colors.white,
                                ),

                                child: Text(
                                  "FLASH SALE TODAY",
                                  style: TextStyle(
                                      color: Color(0xffff0000),
                                      fontFamily: 'Dmsan_regular',
                                      fontSize: screenWidth/76.8,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),

                              Container(
                                height: 2,
                                decoration: BoxDecoration (
                                  color: Color(0xffff0000),
                                ),
                              ),

                              Container(
                                width: screenWidth/1.28,
                                height: screenHeight/50,
                              ),

                              Container(
                                  height: ((screenWidth/1.28/6)/2 * 3 + screenHeight/50) * getLine(dataFlashSale.length, 6),
                                  decoration: BoxDecoration(

                                  ),
                                  child: GridView.builder(
                                    itemCount: dataFlashSale.length,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 6, // số phần tử trên mỗi hàng
                                      mainAxisSpacing: 0, // khoảng cách giữa các hàng
                                      crossAxisSpacing: 5, // khoảng cách giữa các cột
                                      childAspectRatio: 2/3, // tỷ lệ chiều rộng và chiều cao
                                    ),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => proDuctDetailScreen(product: dataFlashSale[index])));
                                          },
                                          child: ProductItemWidget(product: dataFlashSale[index], width: screenWidth/1.28, height: screenHeight),
                                        ),
                                      );
                                    },
                                  )
                              ),


                              Container(
                                width: screenWidth/1.28,
                                height: screenHeight/50,
                              ),

                              Container(
                                height: screenHeight/20,
                                alignment: Alignment.center, // canh giữa theo chiều dọc và ngang
                                decoration: BoxDecoration (
                                  color: Colors.white,
                                ),

                                child: Text(
                                  "FIVE STAR RATE PRODUCT",
                                  style: TextStyle(
                                      color: Color(0xffff0000),
                                      fontFamily: 'Dmsan_regular',
                                      fontSize: screenWidth/76.8,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),

                              Container(
                                height: 2,
                                decoration: BoxDecoration (
                                  color: Color(0xffff0000),
                                ),
                              ),

                              Container(
                                width: screenWidth/1.28,
                                height: screenHeight/50,
                              ),

                              Container(
                                  height: ((screenWidth/1.28/6)/2 * 3 + screenHeight/50) * getLine(dataFiveStar.length, 6),
                                  decoration: BoxDecoration(

                                  ),
                                  child: GridView.builder(
                                    itemCount: dataFiveStar.length,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 6, // số phần tử trên mỗi hàng
                                      mainAxisSpacing: 0, // khoảng cách giữa các hàng
                                      crossAxisSpacing: 5, // khoảng cách giữa các cột
                                      childAspectRatio: 2/3, // tỷ lệ chiều rộng và chiều cao
                                    ),
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => proDuctDetailScreen(product: dataFiveStar[index])));
                                          },
                                          child: ProductItemWidget(product: dataFiveStar[index], width: screenWidth/1.28, height: screenHeight),
                                        ),
                                      );
                                    },
                                  )
                              ),
                            ],
                          ),

                        ),
                      ),

                      Positioned(
                        bottom: 0,
                        left: (screenWidth/1.28 - screenWidth/3)/2,
                        child: Container(
                          width:  screenWidth/3,
                          height:  screenHeight/14,
                          alignment: Alignment.center, // canh giữa theo chiều dọc và ngang
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),

                          child: Stack(
                            children: <Widget>[

                              //Nút home
                              Positioned(
                                top: screenWidth/192,
                                left: screenWidth/192 * 3,
                                child: GestureDetector(
                                  onTap: () {
                                    // Đây là nơi để đặt mã của bạn khi hình ảnh được nhấp vào
                                    print("Hình ảnh đã được nhấp vào!");
                                  },
                                  child: Container(
                                    width: (screenHeight/14 - 2 * screenWidth/192),
                                    height: (screenHeight/14 - 2 * screenWidth/192),
                                    decoration: BoxDecoration(
                                    ),
                                    child: Image.asset(
                                      "assets/mainMenuIcon/Home.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),

                              //Nút giỏ hàng
                              Positioned(
                                top: screenWidth/192,
                                left: screenWidth/10,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => CartScreen()));
                                  },
                                  child: Container(
                                    width: (screenHeight/14 - 2 * screenWidth/192),
                                    height: (screenHeight/14 - 2 * screenWidth/192),
                                    decoration: BoxDecoration(
                                    ),
                                    child: Image.asset(
                                      "assets/mainMenuIcon/Shop.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),

                              //Nút yêu thích
                              Positioned(
                                top: screenWidth/192,
                                right: screenWidth/10,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => WishlistScreen()));
                                  },
                                  child: Container(
                                    width: (screenHeight/14 - 1.4 * screenWidth/192),
                                    height: (screenHeight/14 - 2 * screenWidth/192),
                                    decoration: BoxDecoration(
                                    ),
                                    child: Image.asset(
                                      "assets/mainMenuIcon/Wishlist.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),

                              //Nút Account
                              Positioned(
                                top: screenWidth/192,
                                right: screenWidth/192 * 3,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => SettingScreen()));
                                  },
                                  child: Container(
                                    width: (screenHeight/14 - 2 * screenWidth/192),
                                    height: (screenHeight/14 - 2 * screenWidth/192),
                                    decoration: BoxDecoration(
                                    ),
                                    child: Image.asset(
                                      "assets/mainMenuIcon/Profile.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),
                    ],
                  ),


                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
