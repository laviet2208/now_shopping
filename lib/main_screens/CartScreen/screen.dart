import 'package:flutter/material.dart';
import 'package:ning_web/Finalclass/finalclass.dart';
import 'package:ning_web/main_screens/CartScreen/item.dart';
import 'package:ning_web/main_screens/MainmenuScreen/mainmenu.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
                  "  N-ing Shop  |  My Product Cart",
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
                  color: Colors.white,
                  border: Border.all(
                      color: Color(0xff3669c9),
                      width: 1.0,
                  ),
                ),

                child: Stack(
                  children: <Widget>[

                    //Nút back
                    Positioned(
                      top: screenHeight/192,
                      left: screenHeight/192,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => MainMenuScreen()));
                        },
                        child: Container(
                          width:  screenWidth/64,
                          height:  screenWidth/64,
                          child: Image.network(
                            "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/back.png?alt=media&token=b11dc59b-d95c-4b3d-aa2d-346c07cd29c1",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: screenHeight/192 + screenWidth/64 + 10,
                      left: screenHeight/192,
                      child: Container(
                        width: screenWidth/1.28 - 4*screenHeight/192,
                          height: screenHeight - screenHeight/10 - 40 - (screenHeight/192 + screenWidth/64 + 10) - 10,
                          decoration: BoxDecoration(
                          ),
                          child: GridView.builder(
                            itemCount: currentAccount.productCarts.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1, // số phần tử trên mỗi hàng
                              mainAxisSpacing: 10, // khoảng cách giữa các hàng
                              childAspectRatio: 6/1, // tỷ lệ chiều rộng và chiều cao
                            ),
                            itemBuilder: (context, index) {
                              return ProductCart(product: currentAccount.productCarts[index], width: screenWidth/1.28 - 4*screenHeight/192, height: (screenWidth/1.28 - 4*screenHeight/192)/6);
                            },
                          )
                      ),
                    )
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
