import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../Finalclass/finalclass.dart';
import '../../../General/bill/cartBill.dart';
import '../../ExitingorderScreen/ItemMobile/orderHistoryitem.dart';
class existingOrderPage extends StatefulWidget {
  final double width;
  final double height;
  const existingOrderPage({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  State<existingOrderPage> createState() => _existingOrderPageState();
}

class _existingOrderPageState extends State<existingOrderPage> {
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
    return Scaffold(
      body: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: widget.width/3,
              child: Container(
                height: widget.height-40,
                width: widget.width/3,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black
                  )
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
                          child: itemOrderHisMobi(cartbill: data[index], width: widget.width/3 * 0.96, heith: widget.width/3 * 0.9),
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
