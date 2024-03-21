import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ning_web/Button/Buttontype1.dart';

import '../../../General/bill/cartBill.dart';
import '../../Item/mobile/productItem.dart';

class itemOrderHisMobi extends StatefulWidget {
  final cartBill cartbill;
  final double width;
  final double heith;
  const itemOrderHisMobi({Key? key, required this.cartbill, required this.width, required this.heith}) : super(key: key);

  @override
  State<itemOrderHisMobi> createState() => _itemOrderHisMobiState();
}

class _itemOrderHisMobiState extends State<itemOrderHisMobi> {
  Future<void> pushdata(String status) async {
    final reference = FirebaseDatabase.instance.reference();
    await reference.child("cartBill/" + widget.cartbill.ID + "/status").set(status);
  }

  @override
  Widget build(BuildContext context) {
    String status = "";
    Color color = Colors.black;

    if (widget.cartbill.status == "C") {
      status = "Status : Complete";
      color = Colors.green;
    } else if(widget.cartbill.status == "U") {
      status = "Status : Progressing";
      color = Colors.redAccent;
    } else if(widget.cartbill.status == "D") {
      status = "Status : Cancel Progressing";
      color = Colors.orangeAccent;
    } else if(widget.cartbill.status == "DC") {
      status = "Status : Complete";
      color = Colors.orangeAccent;
    }
    return Scaffold(
      body: Container(
        width: widget.width,
        height: widget.heith,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
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
                top: 5,
                left: 5,
              child: Container(
                width: widget.width - 10,
                height: 248,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.cartbill.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                      child: InkWell(
                        onTap: () {

                        },
                        child: ProductItemMobiWidget(product: widget.cartbill.products[index]),
                      ),
                    );
                  },
                ),
              ),
            ),

            Positioned(
              top: 258,
              left: 5,
              child: Text(
                "+) " + status,
                style: TextStyle(
                  fontSize: widget.width / 18,
                  fontFamily: 'Dmsan_regular',
                  color: color
                ),
              )
            ),

            Positioned(
                top: 288,
                left: 5,
                child: Text(
                  "+) Phone : " + widget.cartbill.phoneNum,
                  style: TextStyle(
                      fontSize: widget.width / 18,
                      fontFamily: 'Dmsan_regular',
                      color: color
                  ),
                )
            ),

            Positioned(
                top: 318,
                left: 5,
                child: Text(
                  "+) Order Id : " + widget.cartbill.ID,
                  style: TextStyle(
                      fontSize: widget.width / 18,
                      fontFamily: 'Dmsan_regular',
                      color: Colors.blueAccent,
                    fontWeight: FontWeight.bold
                  ),
                )
            ),

            Positioned(
                left: 5,
                bottom: 5,

                child: Container(
                  width: widget.width / 4,
                  height: widget.width / 8,
                  child: ButtonType1(Height: widget.width / 8, Width: widget.width / 4, color: Colors.red, radiusBorder: 15, title: "Cancel order", fontText: 'Dmsan_regular', colorText: Colors.white,
                      onTap: () {
                         if (widget.cartbill.status != "D" && widget.cartbill.status != "DC") {
                           pushdata("D");
                         }
                      }),
                ),
            )
          ],
        ),
      ),
    );
  }
}
