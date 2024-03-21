import 'package:flutter/material.dart';

class ProductitemImageWidget extends StatelessWidget {
  final String productURL;
  final double width;

  const ProductitemImageWidget({super.key, required this.productURL, required this.width});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width,
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
              width: width,
              height: width,
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