import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {
  final String productURL;
  final double width;

  const ProductImageWidget({super.key, required this.productURL, required this.width});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: (width)/4,
      height: (width)/4,
      decoration: BoxDecoration(
        color : Colors.white,
      ),

      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,

            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(
                  color: Colors.orange,
                  width: 2.0,
                ),
              ),
              width: (width)/4,
              height: (width)/4,
              child: Image.network(
                productURL,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}