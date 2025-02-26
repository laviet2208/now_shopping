import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:ning_web/main_screens/Before_entering/home_screen.dart';
import 'package:ning_web/main_screens/Screenwait/Screenwaitpc.dart';
import 'package:ning_web/utils/utils.dart';

import '../../General/Product/Product.dart';
import '../../General/Tool/ChangeNumber.dart';
import '../../General/Tool/Compact.dart';
import '../Item/mobile/productItem.dart';
import '../MainmenuScreen/Danh mục loại 1.dart';
import '../MainmenuScreen/Danh mục loại 2.dart';
import '../MainmenuScreen/Data loại sản phẩm.dart';
import '../MainmenuScreen/Item loại sản phẩm.dart';
import '../MainmenuScreen/Quảng cáo đầu danh sách.dart';

class Screenwait extends StatefulWidget {
  const Screenwait({Key? key}) : super(key: key);

  @override
  State<Screenwait> createState() => _ScreenwaitState();
}

class _ScreenwaitState extends State<Screenwait> {
  List<String> adsList = [];
  List<Product> featuredList = [];
  List<Product> manfashionList = [];
  List<Product> womanfashionList = [];
  List<Product> computerList = [];
  List<List<Product>> product_list = [];

  void getADSdata() {
    final reference = FirebaseDatabase.instance.ref();
    reference.child("ads").onValue.listen((event) {
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
    reference.child("product").limitToFirst(20).once().then((DatabaseEvent event) {
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
    double fem = MediaQuery.of(context).size.width / baseWidth;

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
                  itemCount: 11,
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

            Container(height: 20,),

            ProductDirectoryType2(dataType: DataListType.listType[0], productList: product_list[0],),

            Container(height: 20,),

            ProductDirectoryType2(dataType: DataListType.listType[1], productList: product_list[1],),

            Container(height: 20,),

            ProductDirectoryType2(dataType: DataListType.listType[2], productList: product_list[2],),

            Container(height: 20,),

          ],
        ),
      ),
    );
  }
}
