import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../General/Product/Product.dart';
import '../Item/mobile/productItem.dart';
import '../ProductDetailsScreen/productDetailScreen.dart';

class viewallproduct extends StatefulWidget {
  final int type;
  const viewallproduct({Key? key, required this.type}) : super(key: key);

  @override
  State<viewallproduct> createState() => _viewallproductState();
}

class _viewallproductState extends State<viewallproduct> {
  List<Product> data = [];

  void getFeaturedData() {
    final reference = FirebaseDatabase.instance.reference();
    reference.child("product").onValue.listen((event) {
      final dynamic product = event.snapshot.value;
      data.clear();
      product.forEach((key, value) {
        Product setPro = Product.fromJson(value);
        if (widget.type == 1) {
          data.add(setPro);
          setState(() {
          });
        } else {
          if (setPro.isSale) {
            data.add(setPro);
            setState(() {
            });
          }
        }
      });

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFeaturedData();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String title = "FEATURED";
    if (widget.type == 2) {
      title = "FLASH SALE";
    }



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              'assets/logo_1.png',
              width: screenWidth/7.84,
              height: screenWidth/7.84,
            ),

            SizedBox(width: 10),

            Text(
              'N-iNG',
              style: TextStyle(
                fontFamily: "logo_font_1",
                fontSize: screenWidth/19.65,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),

            SizedBox(width: 5),

            Text(
              title,
              style: TextStyle(
                fontFamily: "logo_font_1",
                fontSize: screenWidth/19.65,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),
          ],
        ),
      ),

      body: Container(
        decoration: BoxDecoration (
          color: Color(0xfff5f5f5),
        ),

        child: ListView(
          children: [
            Container(
              height: 20,
              decoration: BoxDecoration(
              ),
            ),

            Container(
              width: screenWidth * 0.98,
              height: 0.9 * screenHeight,
              child: ListView(
                children: [
                  Container(
                    height: 10,
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                        height: screenHeight,
                        child: GridView.builder(
                          itemCount: data.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // số phần tử trên mỗi hàng
                            mainAxisSpacing: 0, // khoảng cách giữa các hàng
                            crossAxisSpacing: 0, // khoảng cách giữa các cột
                            childAspectRatio: 0.7, // tỷ lệ chiều rộng và chiều cao
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => proDuctDetailScreen(product: data[index])));
                                },
                                child: ProductItemMobiWidget(product: data[index]),
                              ),
                            );
                          },
                        )
                    ),
                  ),

                  Container(height: 100,)
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
