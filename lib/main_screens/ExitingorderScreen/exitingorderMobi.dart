import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ning_web/Finalclass/finalclass.dart';
import 'package:ning_web/main_screens/ExitingorderScreen/ItemMobile/orderHistoryitem.dart';

import '../../General/bill/cartBill.dart';

class ExitingorderMobiScreen extends StatefulWidget {
  const ExitingorderMobiScreen({Key? key}) : super(key: key);

  @override
  State<ExitingorderMobiScreen> createState() => _ExitingorderMobiScreenState();
}

class _ExitingorderMobiScreenState extends State<ExitingorderMobiScreen> {
  List<cartBill> data = [];

  void getData() {
    final reference = FirebaseDatabase.instance.reference();
    reference.child("cartBill").onValue.listen((event) {
      final dynamic bill = event.snapshot.value;
      print(bill.toString());

      data.clear();
      bill.forEach((key, value) {
        // Map<String, dynamic> product2 = value as Map<String, dynamic>;
        cartBill setPro = cartBill.fromJson(value);
        if (setPro.owner.id == currentAccount.id) {
          data.add(setPro);
        }
      });
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

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
              'MY ORDER',
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
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: Stack(
          children: <Widget>[

            Positioned(
              top: 0.03*screenHeight,
              left: 0.02*screenWidth,
              child: Container(
                height: screenHeight * 0.85,
                width: screenWidth * 0.96,
                decoration: BoxDecoration(

                ),

                  child: GridView.builder(
                    itemCount: data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, // số phần tử trên mỗi hàng
                      mainAxisSpacing: 10, // khoảng cách giữa các hàng
                      crossAxisSpacing: 0, // khoảng cách giữa các cột
                      childAspectRatio: 1/(1.2), // tỷ lệ chiều rộng và chiều cao
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                        child: InkWell(
                          child: itemOrderHisMobi(cartbill: data[index], width: screenWidth * 0.96, heith: screenWidth * 0.96 * 1.2),
                        ),
                      );
                    },
                  )
              ),
            )

          ],
        ),
      ),
    );
  }
}
