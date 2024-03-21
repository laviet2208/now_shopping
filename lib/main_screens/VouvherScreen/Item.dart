import 'package:flutter/material.dart';
import 'package:ning_web/General/Tool/ChangeNumber.dart';

import '../../Button/Buttontype1.dart';
import '../../General/Product/Voucher.dart';

class VoucherItem extends StatefulWidget {
  final voucher product;
  final double width;
  final double height;
  const VoucherItem({Key? key, required this.product, required this.width, required this.height}) : super(key: key);

  @override
  State<VoucherItem> createState() => _VoucherItemState();
}

class _VoucherItemState extends State<VoucherItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height ,
      decoration: BoxDecoration(
          color : Colors.white,
          border: Border.all(
            width: 1,
            color: Color(0xff3669c9),
          )
      ),

      child: Stack(
        children: <Widget>[
          //Tên shop
          Positioned(
            top: 5,
            left: 5,
            child: Container(
              width:  widget.width - 10,
              height:  (widget.width/45) ,
              alignment: Alignment.centerLeft, // canh giữa theo chiều dọc và ngang
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xff3669c9),
                    width: 2.0,
                  ),
                ),
              ),
              child: Text(
                "New Voucher",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Dmsan_regular',
                  fontSize: widget.height/20,
                ),
              ),
            ),
          ),

          Positioned(
            top: widget.height/5,
            left: widget.height/6,
            child: Container(
              width:  widget.height/1.5,
              height: widget.height/1.5,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xff3669c9),
                  width: 2.0,
                ),
              ),
              child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2Fvcpngtree.png?alt=media&token=c41fe7cb-b450-465d-a038-79edb149d98e",
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            top: widget.height/5,
            left: widget.height/6 + widget.height/1.5 + 20,
            child: Container(
              width:  widget.height/1.5 * 6,
              height: widget.height/5,
              child: Text(
                "This voucher will be sale off " + widget.product.totalMoney.toString() + ".\$ For you, you can use this for all of product",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Dmsan_regular',
                  fontSize: widget.height/10,
                ),
              )
            ),
          ),

          Positioned(
            top: widget.height/5 + 38,
            left: widget.height/6 + widget.height/1.5 + 20,
            child: Container(
                width:  widget.height/1.5 * 6,
                height: widget.height/5,
                child: Text(
                  "+) Start Time : " + getTimeString(widget.product.startTime),
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Dmsan_regular',
                    fontSize: widget.height/10,
                  ),
                )
            ),
          ),

          Positioned(
            top: widget.height/5 + 72,
            left: widget.height/6 + widget.height/1.5 + 20,
            child: Container(
                width:  widget.height/1.5 * 6,
                height: widget.height/5,
                child: Text(
                  "+) End Time : " + getTimeString(widget.product.endTime),
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Dmsan_regular',
                    fontSize: widget.height/10,
                  ),
                )
            ),
          ),

          Positioned(
            top: widget.height/5 + 122,
            left: widget.height/6 + widget.height/1.5 + 20,
            child: Container(
                width:  widget.height,
                height: widget.height/5,
                child: ButtonType1(Height: widget.height/5, Width: widget.height/1.5 * 5, color: Color.fromRGBO(255, 184, 0, 1), radiusBorder: 10, title: "Gift", fontText: 'Dmsan_regular', colorText: Colors.black,
                  onTap: (){},
                  loading: false,
                ),
            ),
          ),


          Positioned(
            top: widget.height/4.5,
            left: 5,
            child: Container(
              width:  widget.height/9,
              height: widget.height/9,
              child: Checkbox(
                value: false,
                onChanged: (bool? value) {
                  setState(() {

                  });
                },
              ),
            ),
          )

        ],
      ),
    );
  }
}
