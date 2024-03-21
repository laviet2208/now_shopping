import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ning_web/Button/Buttontype1.dart';
import 'package:ning_web/utils/utils.dart';

import '../../../Finalclass/finalclass.dart';
import 'mobivoucherselectitem.dart';

class VoucherScreenslMobi extends StatefulWidget {
  const VoucherScreenslMobi({Key? key}) : super(key: key);

  @override
  State<VoucherScreenslMobi> createState() => _VoucherScreenslMobiState();
}

class _VoucherScreenslMobiState extends State<VoucherScreenslMobi> {

  final emailController = TextEditingController();
  final emailKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
              'VOUCHER',
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
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration (
          color: Color(0xfff5f5f5),
        ),

        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0.02 * screenHeight,
              left: 0.01 * screenWidth,
              child: Container(
                width: screenWidth * 0.98,
                height: screenHeight*0.9 - screenWidth/2,
                child: ListView(
                  children: [
                    Container(
                      height: 5,
                    ),

                    Container(
                        height: screenHeight/1.8 ,
                        child: GridView.builder(
                          itemCount: currentAccount.voucherList.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, // số phần tử trên mỗi hàng
                            mainAxisSpacing: 10, // khoảng cách giữa các hàng
                            crossAxisSpacing: 0, // khoảng cách giữa các cột
                            childAspectRatio: 2/1, // tỷ lệ chiều rộng và chiều cao
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                              child: InkWell(
                                child: VoucherselectItemMobile(thisvoucher: currentAccount.voucherList[index], width: screenWidth * 0.98, height: screenWidth * 0.49),
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
