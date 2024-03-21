import 'package:flutter/material.dart';

import '../../../Finalclass/finalclass.dart';
import '../../CartScreen/payment/mobivoucherselectitem.dart';
import '../PC_ITEM/ITEMvoucherselect.dart';

class Screenselectvoucherpc extends StatefulWidget {

  const Screenselectvoucherpc({Key? key}) : super(key: key);

  @override
  State<Screenselectvoucherpc> createState() => _ScreenselectvoucherpcState();
}

class _ScreenselectvoucherpcState extends State<Screenselectvoucherpc> {
  final emailController = TextEditingController();
  final emailKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
              top: 10,
              left: (screenWidth- screenWidth/4)/2,
              child: Container(
                width: screenWidth/4,
                height: screenHeight-40,
                child: ListView(
                  children: [
                    Container(
                      height: 5,
                    ),

                    Container(
                        height: screenHeight-40,
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
                                child: ITEMselectvoucherPC(thisvoucher: currentAccount.voucherList[index], width: screenWidth * 0.98, height: screenWidth * 0.49),
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
