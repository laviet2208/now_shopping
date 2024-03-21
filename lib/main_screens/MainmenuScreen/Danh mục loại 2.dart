import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:ning_web/main_screens/MainmenuScreen/Lo%E1%BA%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m.dart';

import '../../Finalclass/finalclass.dart';
import '../../General/Product/Product.dart';
import '../Before_entering/signin_screen.dart';
import '../ProductDetailsScreen/mobile.dart';
import 'Item sản phẩm.dart';
import 'Xem theo loại sản phẩm/Màn hình xem loại sản phẩm.dart';

class ProductDirectoryType2 extends StatefulWidget {
  final DataType dataType;
  const ProductDirectoryType2({Key? key, required this.dataType}) : super(key: key);

  @override
  State<ProductDirectoryType2> createState() => _ProductDirectoryType2State();
}

class _ProductDirectoryType2State extends State<ProductDirectoryType2> {
  int _currentIndex = 0;
  int _itemsPerPage = 2;
  List<Product> productList = [];

  void getFeaturedData() {
    final reference = FirebaseDatabase.instance.reference();
    reference.child("product").orderByChild('type/0').equalTo(widget.dataType.type).onValue.listen((event) {
      final dynamic product = event.snapshot.value;
      productList.clear();
      product.forEach((key, value) {
        Product setPro = Product.fromJson(value);
        if (productList.length <= 6) {
          if (widget.dataType.imageUrl == 'assets/icons/flashsale.png') {
            if (setPro.isSale) {
              productList.add(setPro);
            }
          } else {
            if (setPro.type[0] == widget.dataType.type) {
              productList.add(setPro);
            }
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height/2.5;
    double width = MediaQuery.of(context).size.width;
    int startIndex = _currentIndex * _itemsPerPage;
    int endIndex = (_currentIndex + 1) * _itemsPerPage;
    endIndex = endIndex > productList.length ? productList.length : endIndex;

    List<Product> currentPageItems = productList.sublist(startIndex, endIndex);

    return Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            bottom: 0,
            left: 15,
            right: 15,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                    width: 0.3,
                    color: Colors.grey.withOpacity(0.5)
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 5,
                    right: 5,
                    child: Container(
                      height: height/7,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 0.5,
                                  color: Colors.grey.withOpacity(0.4)
                              )
                          )
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            bottom: 0,
                            left: 0,
                            right: (MediaQuery.of(context).size.width - 40)/2,
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 2,
                                            color: Colors.deepOrange
                                        )
                                    )
                                ),
                                alignment: Alignment.center,
                                child: LocaleText(
                                    widget.dataType.name,
                                    style: TextStyle(
                                      fontFamily: 'roboto',
                                      fontSize: height/18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )
                                )
                            ),
                          ),

                          Positioned(
                            top: 10,
                            left:  (MediaQuery.of(context).size.width - 40)/2 + (MediaQuery.of(context).size.width - 40)/6,
                            right: 10,
                            bottom: 10,
                            child: GestureDetector(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    'Xem thêm',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'roboto',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11
                                    ),
                                  ),
                                ),
                              ),

                              onTap: () {
                                if (currentAccount.id != '') {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ScreenViewProductByType(dataType: widget.dataType,),),);
                                } else {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => SigninScreen(),),);
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: height/7 + height/14,
                    bottom: height/14,
                    left: 5,
                    right: 5,
                    child: productList.isNotEmpty ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      //controller: _pageController,
                      child: Row(
                        children: currentPageItems.map((item) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          width: (width - 30 - 50)/2,
                          child: GestureDetector(
                            child: ItemSanPham(product: item),
                            onTap: () {
                              if (currentAccount.id != '') {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => mobiDetailProduct(product: item),),);
                              } else {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => SigninScreen(),),);
                              }
                              },
                          ),
                        ),
                        ).toList(),
                      ),
                    ) : Container(alignment: Alignment.center, child: Text('Danh sách trống', style: TextStyle(color: Colors.grey),),),
                  )
                ],
              ),
            ),
          ),

          Positioned(
            top: 2.2 * height/5,
            left: 3,
            bottom: 2.2 * height/5,
            child: GestureDetector(
              child: Container(
                width: 0.6 * height/5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  border: Border.all(
                      width: 0.3,
                      color: Colors.grey.withOpacity(0.5)
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2), // màu của shadow
                      spreadRadius: 5, // bán kính của shadow
                      blurRadius: 7, // độ mờ của shadow
                      offset: Offset(0, 3), // vị trí của shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.grey,
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  // if (_currentIndex > 0) {
                  //   _pageController.animateToPage(_currentIndex - 1, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                  // }
                  if (_currentIndex > 0) {
                    _currentIndex--;
                  }
                });
              },
            ),
          ),

          Positioned(
            top: 2.2 * height/5,
            right: 3,
            bottom: 2.2 * height/5,
            child: GestureDetector(
              child: Container(
                width: 0.6 * height/5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1000),
                  border: Border.all(
                      width: 0.3,
                      color: Colors.grey.withOpacity(0.5)
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2), // màu của shadow
                      spreadRadius: 5, // bán kính của shadow
                      blurRadius: 7, // độ mờ của shadow
                      offset: Offset(0, 3), // vị trí của shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  // if (_currentIndex < (productList.length / _itemsPerPage).ceil() - 1) {
                  //   _pageController.animateToPage(_currentIndex + 1, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                  // }
                  if ((_currentIndex + 1) * _itemsPerPage < productList.length) {
                    _currentIndex++;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
