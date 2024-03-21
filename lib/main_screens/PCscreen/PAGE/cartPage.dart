import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../../../Button/Buttontype1.dart';
import '../../../Finalclass/finalclass.dart';
import '../../../General/Tool/ChangeNumber.dart';
import '../../../utils/utils.dart';
import '../../CartScreen/MobileItem.dart';
import '../../CartScreen/payment/Mobipayment.dart';
import '../PC_ITEM/ITEM_productcart.dart';
import '../ScreenPayment/SCREENpayment.dart';

class cartPage extends StatefulWidget {
  final double width;
  final double height;
  const cartPage({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  @override
  Widget build(BuildContext context) {
    bool loading = false;

    return Scaffold(
      body: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration (
          color: Color(0xfff5f5f5),
        ),

        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0.0 * widget.height,
              left: 0.01 * widget.width,
              child: Container(
                width: widget.width * 0.98,
                height: 0.91 * widget.height,
                child: ListView(
                  children: [
                    Container(
                      height: 5,
                    ),

                    Container(
                        height: widget.height,
                        child: GridView.builder(
                          itemCount: currentAccount.productCarts.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, // số phần tử trên mỗi hàng
                            mainAxisSpacing: 10, // khoảng cách giữa các hàng
                            crossAxisSpacing: 0, // khoảng cách giữa các cột
                            childAspectRatio: 6/1, // tỷ lệ chiều rộng và chiều cao
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                              child: InkWell(
                                child: ProductCartPC(product: currentAccount.productCarts[index], width: widget.width * 0.98, height: widget.width * 0.49),
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
              left: 0,
              bottom: 10,
              child: Container(
                width: widget.width,
                height: widget.height/11,
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
                      child: LocaleText(
                        "totalmoney",
                        style: TextStyle(
                          fontSize: widget.height*0.03,
                          fontFamily: 'Dmsan_regular',
                          fontWeight: FontWeight.normal,
                          color: Color.fromARGB(255, 54, 105, 201),
                        ),
                      ),
                    ),

                    Positioned(
                        left: 3,
                        bottom: 10,
                        child: ValueListenableBuilder<double>(
                          valueListenable: infoPay.money,
                          builder: (BuildContext context, double value, Widget? child) {
                            return Text(
                              "\$ " + getStringNumber(value),
                              style: TextStyle(
                                fontSize: widget.height*0.025,
                                fontFamily: 'Dmsan_regular',
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(255, 54, 105, 201),
                              ),
                            );
                          },
                        )
                    ),

                    Positioned(
                        left: widget.width/3*2,
                        top: 0,
                        child: Container(
                            width: widget.width/3,
                            height: widget.height/11,
                            decoration: BoxDecoration(
                            ),
                            child:ButtonType1(Height: widget.width/4, Width: widget.width/3, color: Colors.redAccent, radiusBorder: 0, title: "Buy", fontText: 'arial', colorText: Colors.white,
                              onTap: () {
                                setState(() {
                                  loading = true;
                                });

                                if (cartProduct.isEmpty) {
                                  toastMessage("you must select product to continue");
                                } else {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SCREENpayment()),);
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
