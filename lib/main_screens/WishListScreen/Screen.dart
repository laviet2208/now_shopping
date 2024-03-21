import 'package:flutter/material.dart';
import 'package:ning_web/Finalclass/finalclass.dart';

import '../Item/productItem/ProductViewItem.dart';
import '../ProductDetailsScreen/productDetailScreen.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double baseWidth = 1920;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.9;


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
                  "  N-ing Shop  |  My Favorite Products",
                  style: TextStyle(
                    fontFamily: 'Dmsan_regular',
                    fontSize: 60*ffem,
                    height: 0.225*ffem/fem,
                    decoration: TextDecoration.none,
                    color: Color(0xff3669c9),
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
                      height: screenHeight/10,
                      alignment: Alignment.center, // canh giữa theo chiều dọc và ngang
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Color(0xff3669c9),
                          )
                      ),

                      child: Text(
                        "Wishlist",
                        style: TextStyle(
                          fontFamily: 'Dmsan_regular',
                          fontSize: 50*ffem,
                          decoration: TextDecoration.none,
                          color: Color(0xff3669c9),
                        ),
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
                          itemCount: currentAccount.wishList.length,
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
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => proDuctDetailScreen(product: currentAccount.wishList[index])));
                                },
                                child: ProductItemWidget(product: currentAccount.wishList[index], width: screenWidth/1.28, height: screenHeight),
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
