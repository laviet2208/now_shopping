import 'package:firebase_storage/firebase_storage.dart';
import 'package:ning_web/General/Product/Product.dart';
import 'package:flutter/material.dart';

import '../../../General/Tool/ChangeNumber.dart';
class ProductViewItem {
  final Product product;
  final double width;
  final double height;

  const ProductViewItem({required this.product, required this.width, required this.height});


}

class ProductItemWidget extends StatelessWidget {
  final Product product;
  final double width;
  final double height;
  const ProductItemWidget({required this.product, required this.width, required this.height});


  @override
  Widget build(BuildContext context) {
    String flashsale = "";
    Color strokeFlashsale = Colors.white;
    if (product.isSale) {
      flashsale = "Flash Sale";
      strokeFlashsale = Colors.deepOrange;
    }
    return Container(
      width: (width)/6,
      height: (width/6) * 2,
      decoration: BoxDecoration(
        color : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // màu của shadow
            spreadRadius: 5, // bán kính của shadow
            blurRadius: 7, // độ mờ của shadow
            offset: Offset(0, 3), // vị trí của shadow
          ),
        ],
      ),

      child: Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                width:  width/6-8,
                height:  (width/6) ,
                child: Image.network(
                  product.url[0],
                  fit: BoxFit.cover,

                ),
                ),
          ),

          Positioned(
            top: (width/6) + 4,
            left: 4,
            right: 4,
            child: Container(
              width:  width/6-8,
              height:  (width/33) ,
              child: Text(
                product.name,
                style: TextStyle(
                    color: Color(0xff000000),
                    fontFamily: 'Dmsan_regular',
                    fontSize: height/58,
                ),
              ),
            ),
          ),

          Positioned(
            top: (width/6) + 4 + (width/33) + 2,
            left: 4,
            child: Container(
              width:  width/20,
              height:  (width/65) ,
              alignment: Alignment.center, // canh giữa theo chiều dọc và ngang
              decoration: BoxDecoration(
                border: Border.all(
                  color: strokeFlashsale,
                  width: 2.0,
                ),
              ),
              child: Text(
                flashsale,
                style: TextStyle(
                  color: strokeFlashsale,
                  fontFamily: 'Dmsan_regular',
                  fontSize: height/70,
                ),
              ),
            ),
          ),

          Positioned(
            top: (width/6) + 4 + (width/33) + 2 + (width/65) + height/192,
            left: 4,
            child: Container(
              width:  width/18,
              height:  (width/65) ,
              child: Text(
                "\$. " + getStringNumber(product.cost),
                style: TextStyle(
                  color: strokeFlashsale,
                  fontFamily: 'Dmsan_regular',
                  fontSize: height/65,
                ),
              ),
            ),
          ),

          Positioned(
            top: (width/6) + 4 + (width/33) + 2 + (width/65) + height/192,
            right: 6,
            child: Container(
              width:  width/10,
              height:  (width/65) ,
              alignment: Alignment.centerRight, // canh giữa theo chiều dọc và ngang
              child: Text(
                getStringNumber(product.evaluateList.length.toDouble()) + " Reviews",
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Dmsan_regular',
                  fontSize: height/65,
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}