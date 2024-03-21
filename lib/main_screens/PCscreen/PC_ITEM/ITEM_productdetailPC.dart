import 'package:firebase_storage/firebase_storage.dart';
import 'package:ning_web/General/Product/Product.dart';
import 'package:flutter/material.dart';
import 'package:ning_web/General/Tool/Compact.dart';

import '../../../General/Tool/ChangeNumber.dart';

class ProductItemPCWidget extends StatelessWidget {
  final Product product;
  final double width;

  const ProductItemPCWidget({super.key, required this.product, required this.width});


  @override
  Widget build(BuildContext context) {
    String flashsale = "";
    Color strokeFlashsale = Colors.white;
    if (product.isSale) {
      flashsale = "Flash Sale";
      strokeFlashsale = Colors.deepOrange;
    }
    return Container(
      width: (width/4) - 60,
      height: 300,
      decoration: BoxDecoration(
        color : Colors.white,
        borderRadius: BorderRadius.circular(10),
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
            top: 10,
            left: 10,
            child: Container(
              width: (width/4) - 80,
              height: 150,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 246, 246, 246),
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(product.url[0])
                )
              ),
            ),
          ),

          Positioned(
            top: 173,
            left: 13,
            child: Container(
              width: 322-30,
              height: 22,
              alignment: Alignment.centerLeft,

              child: Text(
                compactString(26, product.name),
                style: TextStyle(
                    fontFamily: 'arial',
                    color: Color(0xff000000),
                    fontSize: width/80,
                    fontWeight: FontWeight.normal
                ),
              ),
            ),
          ),

          Positioned(
            top: 203,
            left: 13,
            child: Container(
              width: 130,
              height: 22,
              alignment: Alignment.centerLeft,

              child: Text(
                "\$. " + getStringNumber(product.cost),
                style: TextStyle(
                    fontFamily: 'Dmsan_regular',
                    color: Colors.deepOrange,
                    fontSize: width/80,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),

          Positioned(
            top: 240,
            left: 13,
            child: Container(
              width: 280,
              height: 27,
              decoration: BoxDecoration(

              ),
              alignment: Alignment.centerLeft,
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 2,
                      left: 0,
                      child: Container(
                        width: 20,
                        height: 20,
                        child: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/nowshopping-493ca.appspot.com/o/icon%2Fstar.png?alt=media&token=15f73b76-62ab-46fc-98f0-af7600f40936',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Positioned(
                      top: 2,
                      left: 30,
                      child: Container(
                          child: Text(
                            "5.0",
                            style: TextStyle(
                                fontFamily: 'Dmsan_regular',
                                color: Colors.black,
                                fontSize: width/100,
                                fontWeight: FontWeight.bold
                            ),
                          )
                      ),
                    ),

                  ],
                ),
              ),
            ),
          )



        ],
      ),


    );
  }
}