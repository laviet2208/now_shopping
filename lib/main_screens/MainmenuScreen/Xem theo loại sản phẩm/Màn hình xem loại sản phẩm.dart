import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:ning_web/main_screens/MainmenuScreen/Item%20s%E1%BA%A3n%20ph%E1%BA%A9m.dart';
import 'package:ning_web/main_screens/MainmenuScreen/mainMenuMobi.dart';

import '../../../General/Product/Product.dart';
import '../../ProductDetailsScreen/mobile.dart';
import '../Loại sản phẩm.dart';
import '../mainmenu.dart';

class ScreenViewProductByType extends StatefulWidget {
  final DataType dataType;
  const ScreenViewProductByType({Key? key, required this.dataType}) : super(key: key);

  @override
  State<ScreenViewProductByType> createState() => _ScreenViewProductByTypeState();
}

class _ScreenViewProductByTypeState extends State<ScreenViewProductByType> {
  List<Product> productList = [];

  void getFeaturedData() {
    final reference = FirebaseDatabase.instance.reference();
    reference.child("product").onValue.listen((event) {
      final dynamic product = event.snapshot.value;
      productList.clear();
      product.forEach((key, value) {
        Product setPro = Product.fromJson(value);
          if (widget.dataType.imageUrl == 'assets/icons/flashsale.png') {
            if (setPro.isSale) {
              productList.add(setPro);
            }
          } else {
            if (setPro.type[0] == widget.dataType.type) {
              productList.add(setPro);
            }
          }
        setState(() {

        });
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

    return WillPopScope(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 242, 243, 248)
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 10,
                left: 15,
                right: 15,
                child: Row(
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MainMenuScreen(),),);
                      },
                    ),

                    Container(width: 10,),

                    LocaleText(
                      widget.dataType.name,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontFamily: 'roboto',
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black,
                          fontSize: screenWidth/24,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 40,
                bottom: 10,
                right: 15,
                left: 15,
                child: Container(
                  alignment: Alignment.center,
                  child: productList.length == 0 ? Text('Danh sách trống', style: TextStyle(fontSize: 14, color: Colors.grey),) : GridView.builder(
                    itemCount: productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // số phần tử trên mỗi hàng
                      mainAxisSpacing: 10, // khoảng cách giữa các hàng
                      crossAxisSpacing: 10, // khoảng cách giữa các cột
                      childAspectRatio: 0.7, // tỷ lệ chiều rộng và chiều cao
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: ItemSanPham(product: productList[index]),
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => mobiDetailProduct(product: productList[index]),),);
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
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
                'DESTINY ASIA',
                style: TextStyle(
                  fontFamily: "logo_font_1",
                  fontSize: screenWidth/19.65,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 7, 104),
                ),
              ),

              SizedBox(width: 5),
            ],
          ),
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
