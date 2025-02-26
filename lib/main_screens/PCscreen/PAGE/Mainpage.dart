
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:ning_web/Finalclass/finalclass.dart';
import 'package:ning_web/General/Shop/Shop.dart';
import 'package:ning_web/main_screens/PCscreen/PAGE/DetailPage.dart';
import 'package:ning_web/main_screens/PCscreen/PAGE/ViewallPage.dart';

import '../../../General/Product/Product.dart';
import '../../../General/Tool/ChangeNumber.dart';
import '../../../General/Tool/Compact.dart';
import '../../../utils/utils.dart';
import '../../Before_entering/home_screen.dart';
import '../../Item/mobile/productItem.dart';
import '../PC_ITEM/ITEM_productdetailPC.dart';

class Mainpage extends StatefulWidget {
  final double width;
  final double height;
  final int type;
  const Mainpage({Key? key, required this.width, required this.height, required this.type}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  Product product = Product(id: 'id', name: 'name', content: 'content', type: [], cost: 1, url: [], imageList: [], evaluateList: [], isSale: true,
      shop: Shop(owner: currentAccount, id: '', url: '', name: '', followList: []));
  int selectindex = 0;
  List<Product> dataFearture = [];
  List<Product> dataFlashSale = [];
  List<Product> dataFiveStar = [];
  String ad1 = "https://firebasestorage.googleapis.com/v0/b/nowshopping-493ca.appspot.com/o/ads%2Fads_no_content.png?alt=media&token=d4431d5b-46d6-4e49-bfb7-0da840ac88fb";
  String ad2 = "https://firebasestorage.googleapis.com/v0/b/nowshopping-493ca.appspot.com/o/ads%2Fads_no_content.png?alt=media&token=d4431d5b-46d6-4e49-bfb7-0da840ac88fb";
  String ad3 = "https://firebasestorage.googleapis.com/v0/b/nowshopping-493ca.appspot.com/o/ads%2Fads_no_content.png?alt=media&token=d4431d5b-46d6-4e49-bfb7-0da840ac88fb";

  int ads1 = 0;
  int ads2 = 0;
  String ads1text = "...";
  String ads2text = "...";

  void getADSdata1() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("ads/0").onValue.listen((event) {
      final dynamic product = event.snapshot.value;
      ad1 = product.toString();
      setState(() {

      });
    });
  }

  void getADSdata2() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("ads/1").onValue.listen((event) {
      final dynamic product = event.snapshot.value;
      ad2 = product.toString();
      setState(() {

      });
    });
  }

  void getADSdata3() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("ads/2").onValue.listen((event) {
      final dynamic product = event.snapshot.value;
      ad3 = product.toString();
      setState(() {

      });
    });
  }

  void getFeaturedData() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("product").onValue.listen((event) {
      final dynamic product = event.snapshot.value;
      dataFearture.clear();
      dataFlashSale.clear();
      dataFiveStar.clear();
      product.forEach((key, value) {
        // Map<String, dynamic> product2 = value as Map<String, dynamic>;
        Product setPro = Product.fromJson(value);
        dataFearture.add(setPro);
        if (setPro.isSale) {
          dataFlashSale.add(setPro);
        }
        if (countRatedb(setPro.evaluateList) >= 4) {
          dataFiveStar.add(setPro);
        }
      });
      setState(() {
        ads1 = get_randomnumber(0, dataFlashSale.length - 1);
        ads1text = dataFlashSale[ads1].name;
        ads2 = get_randomnumber(0, dataFearture.length - 1);
        ads2text = dataFearture[ads2].name;
      });
    });
  }

  Widget getBodyWidget() {
    // Dựa vào selectedIndex, trả về phần body tương ứng
    switch (selectindex) {
      case 0:
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
              color: Colors.white
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: widget.width,
                  height: widget.height/12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 225, 225, 226)
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: widget.width/4,right: widget.width/4, top: 13, bottom: 13),
                    child: Container(
                      width: widget.width/3,
                      height: widget.height - 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Form(
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Dmsan_regular',
                            //Thêm textAlignVertical vào TextStyle
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter your Email";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'search by product name',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 196, 197, 196),
                              fontFamily: 'Dmsan_regular',
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                            isDense: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 0,
                top: widget.height/12,
                child: Container(
                  width: widget.width,
                  height: widget.height,
                  child: ListView(
                    children: [
                      Container(height: 20,),

                      Padding(
                        padding: EdgeInsets.only(left: 0),
                        child: Text(
                          'Special Offer',
                          style: TextStyle(
                              fontFamily: 'Dmsan_regular',
                              fontSize: widget.width/50,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),

                      Container(height: 20,),

                      Container(
                        width: widget.width,
                        height: ((widget.width - 90)/3) / (1260/600),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                width: ((widget.width - 90)/3),
                                height: ((widget.width - 90)/3) / (1260/600),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(ad1)
                                    )
                                ),
                              ),
                            ),

                            Positioned(
                              top: 0,
                              left: ((widget.width - 90)/3) + 20,
                              child: Container(
                                width: ((widget.width - 90)/3),
                                height: ((widget.width - 90)/3) / (1260/600),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(ad2)
                                    )
                                ),
                              ),
                            ),

                            Positioned(
                              top: 0,
                              left: ((widget.width - 90)/3) * 2 + 40,
                              child: Container(
                                width: ((widget.width - 90)/3),
                                height: ((widget.width - 90)/3) / (1260/600),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(ad3)
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      Container(height: 20,),

                      Padding(
                          padding: EdgeInsets.only(left: 0),
                          child: Container(
                            height: widget.height/16,
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Text(
                                    'Flashsale products',
                                    style: TextStyle(
                                        fontFamily: 'Dmsan_regular',
                                        fontSize: widget.width/50,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),

                                Positioned(
                                    top: 0,
                                    right: 20,
                                    child: GestureDetector(
                                      onTap: () {
                                        selectindex = 1;
                                        setState(() {
                                        });
                                      },
                                      child: Text(
                                        'View all',
                                        style: TextStyle(
                                            fontFamily: 'Dmsan_regular',
                                            fontSize: widget.width/50,
                                            color: Colors.blueAccent,
                                            fontWeight: FontWeight.normal
                                        ),
                                      ),
                                    )
                                )
                              ],
                            ),
                          )
                      ),

                      Container(
                        width: widget.width,
                        height: 290,
                        decoration: BoxDecoration(
                            color: Colors.white
                        ),

                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dataFlashSale.length <= 4 ? dataFlashSale.length : 4,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    product = dataFlashSale[index];
                                    Future.delayed(const Duration(milliseconds: 200), () {
                                      setState(() {
                                        selectindex = 3;
                                      });
                                    });
                                  });
                                },
                                child: ProductItemPCWidget(product: dataFlashSale[index], width: widget.width,),
                              ),
                            );
                          },
                        ),
                      ),

                      Container(height: 30,),

                      Container(
                        height: 230,
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 0,
                              left: 30,
                              child: Container(
                                height: 230,
                                width: (widget.width - 110)/2,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 54, 105, 201),
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                        top: 20,
                                        left: 20,
                                        child: Container(
                                          width: (widget.width - 110)/2/2.5,
                                          child: Text(
                                            compactString(20, ads1text),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'arial',
                                                fontWeight: FontWeight.bold,
                                                fontSize: widget.width/60
                                            ),
                                          ),
                                        )
                                    ),

                                    Positioned(
                                        bottom: 25,
                                        left: 10,
                                        child: TextButton(
                                            onPressed: () {
                                              setState(() {
                                                product = dataFlashSale[ads1];
                                                Future.delayed(const Duration(milliseconds: 200), () {
                                                  setState(() {
                                                    selectindex = 3;
                                                  });
                                                });
                                              });
                                            },
                                            child: LocaleText(
                                              "viewnow",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'arial',
                                                  fontSize: widget.width/70,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),
                                            )
                                        )
                                    ),

                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: Container(
                                        width: 230,
                                        height: 230,
                                        decoration: BoxDecoration(

                                        ),
                                        child: Image.network("https://firebasestorage.googleapis.com/v0/b/nowshopping-493ca.appspot.com/o/icon%2FFads1.png?alt=media&token=2f39a53c-faab-464a-82cb-c81a08d6038c",fit: BoxFit.fitHeight),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            Positioned(
                              top: 0,
                              right: 30,
                              child: Container(
                                height: 230,
                                width: (widget.width - 110)/2,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 10, 207, 131),
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                        top: 20,
                                        left: 20,
                                        child: Container(
                                          width: (widget.width - 110)/2/2,
                                          child: Text(
                                            compactString(20, ads2text),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'arial',
                                                fontWeight: FontWeight.bold,
                                                fontSize: widget.width/60
                                            ),
                                          ),
                                        )
                                    ),

                                    Positioned(
                                        bottom: 10,
                                        left: 10,
                                        child: TextButton(
                                            onPressed: () {
                                              setState(() {
                                                product = dataFearture[ads2];
                                                Future.delayed(const Duration(milliseconds: 200), () {
                                                  setState(() {
                                                    selectindex = 3;
                                                  });
                                                });
                                              });
                                            },
                                            child: LocaleText(
                                              "viewnow",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'arial',
                                                  fontSize: widget.width/70,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),
                                            )
                                        )
                                    ),

                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: Container(
                                        width: 230,
                                        height: 230,
                                        decoration: BoxDecoration(

                                        ),
                                        child: Image.network("https://firebasestorage.googleapis.com/v0/b/nowshopping-493ca.appspot.com/o/icon%2FFads2.png?alt=media&token=4e2cad47-10a9-4906-92a9-660fdafcb5a5",fit: BoxFit.fitHeight),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(height: 30,),

                      Container(height: 20,),

                      Padding(
                          padding: EdgeInsets.only(left: 0),
                          child: Container(
                            height: widget.height/16,
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Text(
                                    'Feature products',
                                    style: TextStyle(
                                        fontFamily: 'Dmsan_regular',
                                        fontSize: widget.width/50,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),

                                Positioned(
                                    top: 0,
                                    right: 20,
                                    child: GestureDetector(
                                      onTap: () {
                                        selectindex = 2;
                                        setState(() {
                                        });
                                      },
                                      child: Text(
                                        'View all',
                                        style: TextStyle(
                                            fontFamily: 'Dmsan_regular',
                                            fontSize: widget.width/50,
                                            color: Colors.blueAccent,
                                            fontWeight: FontWeight.normal
                                        ),
                                      ),
                                    )
                                )
                              ],
                            ),
                          )
                      ),

                      Container(
                        width: widget.width,
                        height: 290,
                        decoration: BoxDecoration(
                            color: Colors.white
                        ),

                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dataFearture.length <= 4 ? dataFearture.length : 4,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    product = dataFearture[index];
                                    Future.delayed(const Duration(milliseconds: 200), () {
                                      setState(() {
                                        selectindex = 3;
                                      });
                                    });
                                  });
                                },
                                child: ProductItemPCWidget(product: dataFearture[index], width: widget.width,),
                              ),
                            );
                          },
                        ),
                      ),

                      Container(height: 140,),
                    ],
                  ),
                ),
              ),

            ],
          ),
        );
      case 1:
        return Viewallpage(width: widget.width, height: widget.height, productList: dataFlashSale);
      case 2:
        return Viewallpage(width: widget.width, height: widget.height, productList: dataFearture);
      case 3:
        return detailPage(product: product, width: widget.width, height: widget.height);
      default:
        return Container();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getFeaturedData();
    getADSdata1();
    getADSdata2();
    getADSdata3();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBodyWidget(),
    );
  }
}
