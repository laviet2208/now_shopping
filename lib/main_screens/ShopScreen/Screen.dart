import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ning_web/General/Product/Product.dart';
import 'package:ning_web/General/Shop/Shop.dart';
import 'package:ning_web/General/Tool/ChangeNumber.dart';

import '../Item/productItem/ProductViewItem.dart';
import '../ProductDetailsScreen/productDetailScreen.dart';

class ShopScreen extends StatefulWidget {
  final Shop shop;
  const ShopScreen({Key? key, required this.shop}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {

  List<Product> shopProduct = [];
  String followList = "";
  String rate = "0.0 Star Rate";

  void getData() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("product").onValue.listen((event) {
      final Object? product = event.snapshot.value;
      Map<String, dynamic> product1 = product as Map<String, dynamic>;
      product1.forEach((key, value) {
        Map<String, dynamic> product2 = value as Map<String, dynamic>;
        Product setPro = Product.fromJson(product2);
        if (setPro.shop.id == widget.shop.id) {
          shopProduct.add(setPro);
        }
      });
      if (shopProduct.isEmpty) {

      } else {
        double ra = 0;
        for (int i = 0 ; i < shopProduct.length ; i++) {
          if (shopProduct[i].evaluateList.isEmpty) {

          } else {
            int sum = 0;
            for (int j = 0; j < shopProduct[i].evaluateList.length; j++) {
              sum += shopProduct[i].evaluateList[j].star;
            }
            ra = ra + sum / shopProduct[i].evaluateList.length;
          }
        }
        rate = getStringNumber(ra) + " Star Rates";
      }
      setState(() {});
    });
  }
  @override
  void initState() {
    super.initState();
    getData();
  }



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double baseWidth = 1920;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.9;

    if (widget.shop.followList != null) {
      followList = widget.shop.followList.length.toString() + " Follower";
    } else {
      followList = "0 Follower";
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
              top: 0,
              left: 0,
              child: Container(
                width:  screenWidth,
                height:  screenHeight/10 ,
                alignment: Alignment.centerLeft, // canh giữa theo chiều dọc và ngang
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xff3669c9),
                      width: 2.0,
                    ),
                  ),
                ),
                child: Text(
                  "  Destiny Asia  |  Shop view",
                  style: TextStyle(
                    fontFamily: 'Dmsan_regular',
                    fontSize: 60*ffem,
                    height: 0.225*ffem/fem,
                    decoration: TextDecoration.none,
                    color: Color.fromARGB(255, 1, 7, 104),
                  ),
                ),
              ),
            ),

            Positioned(
              top: screenHeight/10 + 20,
              left: (screenWidth - screenWidth/1.28)/2,
              child: Container(
                width:  screenWidth/1.28,
                height:  screenHeight - screenHeight/10 - 40,
                alignment: Alignment.centerLeft, // canh giữa theo chiều dọc và ngang
                decoration: BoxDecoration(

                ),

                child: ListView(
                  children: [
                    Container(
                      height: screenHeight/30,
                    ),

                    Container(
                      height: screenHeight/5,
                      decoration: BoxDecoration(
                         color: Colors.white,
                         border: Border.all(
                           width: 1,
                           color: Color(0xff3669c9),
                         )
                      ),

                      child: Stack(
                        children: <Widget>[
                          //Ảnh đại diện
                          Positioned(
                            top: (screenHeight/5 - 4 * screenHeight/25)/2,
                            left: screenHeight/25,
                            child: Container(
                              width: 4 * screenHeight/25,
                              height: 4 * screenHeight/25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2 * screenHeight/25),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(widget.shop.url),
                                ),
                                border: Border.all(
                                  color: Color(0xff3669c9),
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),


                          //Tên shop
                          Positioned(
                              top: screenHeight/40,
                              left: screenHeight/25 + 4 * screenHeight/25 + 20,
                              child: Text(widget.shop.name, textAlign: TextAlign.left, style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontFamily: 'Dmsan_regular',
                                  fontSize: screenWidth / 60,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 0
                              ),
                              )
                          ),


                          Positioned(
                              top: screenHeight/10,
                              left: screenHeight/25 + 4 * screenHeight/25 + 20,
                              child: Text(followList + "  |  " + shopProduct.length.toString() + " Products" + "  |  " + rate, textAlign: TextAlign.left, style: TextStyle(
                                  color: Color(0xff3669c9),
                                  fontFamily: 'Dmsan_regular',
                                  fontSize: screenWidth / 70,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 0
                              ),
                              )
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: screenHeight/30,
                    ),

                    Container(
                        height: screenHeight,
                        decoration: BoxDecoration(

                        ),
                        child: GridView.builder(
                          itemCount: shopProduct.length,
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
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => proDuctDetailScreen(product: shopProduct[index])));
                                },
                                child: ProductItemWidget(product: shopProduct[index], width: screenWidth/1.28, height: screenHeight),
                              ),
                            );
                          },
                        )
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
