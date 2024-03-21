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
              child: TopAds(),
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
              child: ProductDirectoryType1(title: 'featured'),
            ),

            Container(height: 20,),

            Container(
              height: DataListType.listType.length * (MediaQuery.of(context).size.height/2.5 + 20),
              child: ListView.builder(
                itemCount: DataListType.listType.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: ProductDirectoryType2(dataType: DataListType.listType[index]),
                  );
                },
              ),
            ),

            Container(height: 20,),

          ],
        ),
      ),
    );
  }
}
