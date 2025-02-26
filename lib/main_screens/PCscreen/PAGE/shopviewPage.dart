import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ning_web/General/Shop/Shop.dart';

import '../../../General/Product/Product.dart';
import '../PC_ITEM/ITEM_productdetailPC.dart';

class shopviewPage extends StatefulWidget {
  final double width;
  final double height;
  final Shop shop;
  const shopviewPage({Key? key, required this.width, required this.height, required this.shop}) : super(key: key);

  @override
  State<shopviewPage> createState() => _shopviewPageState();
}

class _shopviewPageState extends State<shopviewPage> {
  List<Product> shopProduct = [];

  void getData() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("product").onValue.listen((event) {
      final dynamic product = event.snapshot.value;
      shopProduct.clear();
      product.forEach((key, value) {
        Product setPro = Product.fromJson(value);
        if (setPro.shop.id == widget.shop.id) {
          shopProduct.add(setPro);
          setState(() {});
        }
      });

    });
  }
  @override
  void initState() {
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
          children: <Widget>[
            Positioned(
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Container(
                    height: widget.height-30,
                    child: GridView.builder(
                      itemCount: shopProduct.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // số phần tử trên mỗi hàng
                        mainAxisSpacing: 0, // khoảng cách giữa các hàng
                        crossAxisSpacing: 0, // khoảng cách giữa các cột
                        childAspectRatio: ((widget.width/4) - 60)/250, // tỷ lệ chiều rộng và chiều cao
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                          child: InkWell(
                            onTap: () {

                            },
                            child: ProductItemPCWidget(product: shopProduct[index], width: widget.width,),
                          ),
                        );
                      },
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
