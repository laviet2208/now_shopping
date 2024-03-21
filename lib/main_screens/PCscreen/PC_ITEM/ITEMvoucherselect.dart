import 'package:flutter/material.dart';
import 'package:ning_web/Button/Buttontype1.dart';
import 'package:ning_web/General/Product/Voucher.dart';
import 'package:ning_web/General/Tool/ChangeNumber.dart';

import '../../../Finalclass/finalclass.dart';
import '../ScreenPayment/SCREENpayment.dart';

class ITEMselectvoucherPC extends StatefulWidget {
  final voucher thisvoucher;
  final double width;
  final double height;
  const ITEMselectvoucherPC({Key? key, required this.thisvoucher, required this.width, required this.height}) : super(key: key);

  @override
  State<ITEMselectvoucherPC> createState() => _ITEMselectvoucherPCState();
}

class _ITEMselectvoucherPCState extends State<ITEMselectvoucherPC> {
  bool Value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/icons/vouchergift.png")
        ),
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
            bottom: widget.height/2,
            right: -20,
            child: Container(
              width: widget.width/ 4,
              height: widget.height / 5,
              alignment: Alignment.centerLeft,
              child: Transform.rotate(
                angle: 90 * 3.1415926535 / 180, // Góc quay, tính bằng radian (90 độ)
                child: Text(
                  "ID : " + widget.thisvoucher.id,
                  style: TextStyle(
                    fontFamily: 'Dmsan_regular',
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            left: widget.width/8,
            top: 50,
            child: Container(
              alignment: Alignment.topLeft,
              height: 60,
              width: widget.width - (widget.width/8 + 2.8 * widget.height / 5 + widget.width/16 + 5),
              child: Text(
                getStringNumber(widget.thisvoucher.totalMoney) + "\$",
                style: TextStyle(
                    fontFamily: 'arial',
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.normal
                ),
              ),
            ),
          ),

          Positioned(
            left: widget.width/7,
            bottom: 0,
            child: Container(
              alignment: Alignment.topLeft,
              height: 15,
              width: widget.width - (widget.width/8 + 2.8 * widget.height / 5 + widget.width/16 + 5),
              child: Text(
                "Start time : " + getTimeString(widget.thisvoucher.startTime),
                style: TextStyle(
                    fontFamily: 'arial',
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.normal
                ),
              ),
            ),
          ),

          Positioned(
            left: widget.width/1.8,
            bottom: 0,
            child: Container(
              alignment: Alignment.topLeft,
              height: 15,
              width: widget.width - (widget.width/8 + 2.8 * widget.height / 5 + widget.width/16 + 5),
              child: Text(
                "End time : " + getTimeString(widget.thisvoucher.endTime),
                style: TextStyle(
                    fontFamily: 'arial',
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.normal
                ),
              ),
            ),
          ),

          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              alignment: Alignment.topLeft,
              height: 1.2 * widget.height / 5,
              width: widget.width - (widget.width/8 + 2.8 * widget.height / 5 + widget.width/16 + 5),
              child: ButtonType1(Height: 50, Width : 100, color: Colors.redAccent, radiusBorder: 10, title: "Select", fontText: 'Dmsan_regular', colorText: Colors.white,
                  onTap: () {
                    voucherBuySelect.add(widget.thisvoucher);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => SCREENpayment()));
                  }),
            ),
          )
        ],
      ),
    );
  }
}
