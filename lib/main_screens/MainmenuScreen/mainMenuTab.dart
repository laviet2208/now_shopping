import 'package:flutter/material.dart';
import 'package:ning_web/main_screens/MainmenuScreen/Danh%20m%E1%BB%A5c%20lo%E1%BA%A1i%201.dart';
import 'package:ning_web/main_screens/MainmenuScreen/Danh%20m%E1%BB%A5c%20lo%E1%BA%A1i%202.dart';
import 'package:ning_web/main_screens/MainmenuScreen/Data%20lo%E1%BA%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m.dart';
import 'package:ning_web/main_screens/MainmenuScreen/Item%20lo%E1%BA%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m.dart';
import 'package:ning_web/main_screens/MainmenuScreen/Qu%E1%BA%A3ng%20c%C3%A1o%20%C4%91%E1%BA%A7u%20danh%20s%C3%A1ch.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../General/Product/Product.dart';


class mainmenuTab extends StatefulWidget {
  const mainmenuTab({Key? key}) : super(key: key);

  @override
  State<mainmenuTab> createState() => _mainmenuTabState();
}

class _mainmenuTabState extends State<mainmenuTab> {
  List<String> adsList = [];
  List<Product> featuredList = [];
  List<Product> manfashionList = [];
  List<Product> womanfashionList = [];
  List<Product> computerList = [];
  List<List<Product>> product_list = [];

  void getADSdata() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("ads").once().then((DatabaseEvent event) {
      adsList.clear();
      final dynamic product = event.snapshot.value;
      print(product.toString());
      setState(() {
        adsList.add(product[0].toString());
        adsList.add(product[1].toString());
        adsList.add(product[2].toString());
      });
    });
  }

  void getproductData() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("product").limitToFirst(10).once().then((DatabaseEvent event) {
      final dynamic product = event.snapshot.value;
      featuredList.clear();
      manfashionList.clear();
      womanfashionList.clear();
      computerList.clear();
      product.forEach((key, value) {
        Product setPro = Product.fromJson(value);
        featuredList.add(setPro);
        if (setPro.type[0] == 1) {
          product_list[0].add(setPro);
        }
        if (setPro.type[0] == 2) {
          product_list[1].add(setPro);
        }
        if (setPro.type[0] == 3) {
          product_list[2].add(setPro);
        }
      });
      setState(() {

      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    product_list.add(manfashionList);
    product_list.add(womanfashionList);
    product_list.add(computerList);
    getADSdata();
    getproductData();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double baseWidth = 1920;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 242, 243, 248)
        ),

        child: ListView(
          children: [
            Container(height: 10,),

            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: TopAds(adsList: adsList,),
            ),

            Container(height: 10,),

            Padding(
              padding: EdgeInsets.only(left: 15, right: 15,),
              child: Container(
                height: 4 * (screenWidth - 50)/3 + 45,
                decoration: BoxDecoration(
                    color: Colors.white
                ),
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Số cột
                    mainAxisExtent: (screenWidth - 50)/3, // Chiều cao của mỗi item
                    mainAxisSpacing: 15, // Khoảng cách giữa các dòng
                    crossAxisSpacing: 10, // Khoảng cách giữa các cột
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Itemloaisanpham(dataType: DataListType.listType[index]);
                  },
                ),
              ),
            ),

            Container(height: 20,),

            Padding(
              padding: EdgeInsets.only(left: 0, right: 0),
              child: ProductDirectoryType1(title: 'featured', productList: featuredList,),
            ),

            Container(height: 20,),

            ProductDirectoryType2(dataType: DataListType.listType[0], productList: product_list[0],),

            Container(height: 20,),

            ProductDirectoryType2(dataType: DataListType.listType[1], productList: product_list[1],),

            Container(height: 20,),

            ProductDirectoryType2(dataType: DataListType.listType[2], productList: product_list[2],),

            // Container(
            //   height: 3 * (MediaQuery.of(context).size.height/2.5 + 20),
            //   child: ListView.builder(
            //     itemCount: 3,
            //     physics: NeverScrollableScrollPhysics(),
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding: EdgeInsets.only(bottom: 20),
            //         child: ProductDirectoryType2(dataType: DataListType.listType[index], productList: product_list[index],),
            //       );
            //     },
            //   ),
            // ),

            Container(height: 20,),

          ],
        ),
      ),
    );
  }
}
