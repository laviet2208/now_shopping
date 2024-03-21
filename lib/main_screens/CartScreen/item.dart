
import 'package:flutter/material.dart';

import '../../General/Product/Product.dart';

class ProductCart extends StatefulWidget {
  final Product product;
  final double width;
  final double height;
  const ProductCart({Key? key, required this.product, required this.width, required this.height}) : super(key: key);

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  @override
  Widget build(BuildContext context) {
    bool ischeck = false;
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
                "   " + widget.product.shop.name,
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
                widget.product.url[0],
                fit: BoxFit.cover,
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
                value: ischeck,
                onChanged: (bool? value) {
                  setState(() {
                    ischeck = value!;
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

