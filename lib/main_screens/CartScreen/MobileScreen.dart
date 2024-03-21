import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:ning_web/Button/Buttontype1.dart';
import 'package:ning_web/Finalclass/finalclass.dart';
import 'package:ning_web/General/Tool/ChangeNumber.dart';
import 'package:ning_web/main_screens/CartScreen/CartItem.dart';
import 'package:ning_web/main_screens/CartScreen/MobileItem.dart';
import 'package:ning_web/main_screens/CartScreen/payment/Mobipayment.dart';
import 'package:ning_web/utils/utils.dart';

import '../Item/mobile/productItem.dart';
import '../ProductDetailsScreen/productDetailScreen.dart';

class CartMobiScreen extends StatefulWidget {
  const CartMobiScreen({Key? key}) : super(key: key);

  @override
  State<CartMobiScreen> createState() => _CartMobiScreen();
}

class _CartMobiScreen extends State<CartMobiScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool loading = false;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration (
          color: Color.fromARGB(255, 242, 243, 248),
        ),

        child: Stack(
          children: <Widget>[
            Positioned(
              top: 15,
              bottom: screenHeight/11 + 10,
              left: 15,
              right: 15,
              child: Container(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: currentAccount.productCarts.length,
                  itemBuilder: (context, index) {
                    return CartItem(product: currentAccount.productCarts[index]);
                  },
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: screenHeight/15,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // màu của shadow
                      spreadRadius: 5, // bán kính của shadow
                      blurRadius: 7, // độ mờ của shadow
                      offset: Offset(0, 3), // vị trí của shadow
                    ),
                  ],
                ),

                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 3,
                      top: 3,
                      bottom: 0,
                      right: screenWidth/2,
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              child: LocaleText(
                                "totalmoney",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'roboto',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                            ),

                            Container(
                              alignment: Alignment.centerLeft,
                              child: ValueListenableBuilder<double>(
                                valueListenable: infoPay.money,
                                builder: (BuildContext context, double value, Widget? child) {
                                  return Text(
                                    "\$." + getStringNumber(value),
                                    style: TextStyle(
                                      fontSize: screenHeight*0.025,
                                      fontFamily: 'roboto',
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    // Positioned(
                    //     left: 3,
                    //     top: screenWidth/10,
                    //     child: ValueListenableBuilder<double>(
                    //       valueListenable: infoPay.money,
                    //       builder: (BuildContext context, double value, Widget? child) {
                    //         return Text(
                    //           "\$ " + getStringNumber(value),
                    //           style: TextStyle(
                    //             fontSize: screenHeight*0.025,
                    //             fontFamily: 'Dmsan_regular',
                    //             fontWeight: FontWeight.normal,
                    //             color: Color.fromARGB(255, 54, 105, 201),
                    //           ),
                    //         );
                    //       },
                    //     )
                    // ),

                    Positioned(
                        left: screenWidth/3*2,
                        top: 0,
                        bottom: 0,
                        right: 0,
                        child: Container(
                            decoration: BoxDecoration(
                            ),
                            child:ButtonType1(Height: screenWidth/4, Width: screenWidth/3, color: Colors.redAccent, radiusBorder: 5, title: "Buy", fontText: 'roboto', colorText: Colors.white,
                              onTap: () {
                                setState(() {
                                  loading = true;
                                });

                                if (cartProduct.isEmpty) {
                                  toastMessage("you must select product to continue");
                                } else {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PaymentScreenMobi()),);
                                }
                              }, loading: loading,)
                        )
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}
