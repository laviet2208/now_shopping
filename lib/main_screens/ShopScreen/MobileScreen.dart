import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ning_web/General/Product/Product.dart';
import 'package:ning_web/General/Shop/Shop.dart';
import 'package:ning_web/General/Tool/ChangeNumber.dart';

import '../Item/mobile/productItem.dart';
import '../ProductDetailsScreen/productDetailScreen.dart';

class MobiShopScreen extends StatefulWidget {
  final Shop shop;
  const MobiShopScreen({Key? key, required this.shop}) : super(key: key);

  @override
  State<MobiShopScreen> createState() => _MobiShopScreenState();
}

class _MobiShopScreenState extends State<MobiShopScreen> {

  List<Product> shopProduct = [];
  String followList = "";
  String rate = "0.0 Star Rate";

  void getData() {
    final reference = FirebaseDatabase.instance.reference();
    reference.child("product").onValue.listen((event) {
      final dynamic product = event.snapshot.value;
      shopProduct.clear();
      product.forEach((key, value) {
        Product setPro = Product.fromJson(value);
        if (setPro.shop.id == widget.shop.id) {
          shopProduct.add(setPro);
          setState(() {

          });
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              'assets/logo_1.png',
              width: screenWidth/7.84,
              height: screenWidth/7.84,
            ),

            SizedBox(width: 10),

            Text(
              'N-iNG',
              style: TextStyle(
                fontFamily: "logo_font_1",
                fontSize: screenWidth/19.65,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),

            SizedBox(width: 5),

            Text(
              'SHOPVIEW',
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
        decoration: BoxDecoration (
          color: Color(0xfff5f5f5),
        ),

        child: ListView(
          children: [
            Container(
              height: 20,
            decoration: BoxDecoration(
              color: Colors.white
            ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 0, right: 0),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      left: 20,
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60/2),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(widget.shop.url),
                            ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 0,
                      left: 100,
                      child: Container(
                        width: 0.96 * screenWidth - 85,
                        height: 36,
                        child: Text(
                          widget.shop.name,
                          style: TextStyle(
                              fontFamily: 'Dmsan_regular',
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.normal
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 30,
                      left: 100,
                      child: Container(
                        width: 0.96 * screenWidth - 85,
                        height: 36,
                        child: Text(
                          "Official Store",
                          style: TextStyle(
                              fontFamily: 'Dmsan_regular',
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.normal
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            Container(
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.white
              ),
            ),

            Container(
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 10,
                    child: Text(
                      "PRODUCTS",
                      style: TextStyle(
                        fontFamily: 'logo_font_1',
                        fontSize: 20,
                        color: Colors.black
                      ),
                    ),
                  ),

                  Positioned(
                    top: 25,
                    left: 30,
                    child: Text(
                      shopProduct.length.toString() + ".0",
                      style: TextStyle(
                          fontFamily: 'arial',
                          fontSize: 30,
                          color: Colors.black
                      ),
                    ),
                  ),

                  Positioned(
                    top: 0,
                    left: 140,
                    child: Text(
                      "AVERAGE",
                      style: TextStyle(
                          fontFamily: 'logo_font_1',
                          fontSize: 20,
                          color: Colors.black
                      ),
                    ),
                  ),

                  Positioned(
                    top: 25,
                    left: 142,
                    child: Text(
                      countavgProductcost(shopProduct),
                      style: TextStyle(
                          fontFamily: 'arial',
                          fontSize: 30,
                          color: Colors.black
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.white
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 1,
                decoration: BoxDecoration(
                  color: Colors.grey
                ),
              ),
            ),

            Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white
              ),
            ),

            Container(
              width: screenWidth * 0.98,
              height: screenHeight-320,
              child: ListView(
                children: [
                  Container(
                    height: 10,
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                        height: screenHeight - 350,
                        child: GridView.builder(
                          itemCount: shopProduct.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // số phần tử trên mỗi hàng
                            mainAxisSpacing: 0, // khoảng cách giữa các hàng
                            crossAxisSpacing: 0, // khoảng cách giữa các cột
                            childAspectRatio: 0.7, // tỷ lệ chiều rộng và chiều cao
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => proDuctDetailScreen(product: shopProduct[index])));
                                },
                                child: ProductItemMobiWidget(product: shopProduct[index]),
                              ),
                            );
                          },
                        )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
