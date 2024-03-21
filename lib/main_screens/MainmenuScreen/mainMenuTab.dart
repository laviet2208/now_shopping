import 'package:flutter/material.dart';
import 'package:ning_web/main_screens/MainmenuScreen/Danh%20m%E1%BB%A5c%20lo%E1%BA%A1i%201.dart';
import 'package:ning_web/main_screens/MainmenuScreen/Danh%20m%E1%BB%A5c%20lo%E1%BA%A1i%202.dart';
import 'package:ning_web/main_screens/MainmenuScreen/Data%20lo%E1%BA%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m.dart';
import 'package:ning_web/main_screens/MainmenuScreen/Item%20lo%E1%BA%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m.dart';
import 'package:ning_web/main_screens/MainmenuScreen/Qu%E1%BA%A3ng%20c%C3%A1o%20%C4%91%E1%BA%A7u%20danh%20s%C3%A1ch.dart';


class mainmenuTab extends StatefulWidget {
  const mainmenuTab({Key? key}) : super(key: key);

  @override
  State<mainmenuTab> createState() => _mainmenuTabState();
}

class _mainmenuTabState extends State<mainmenuTab> {

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
              child: ProductDirectoryType1(title: 'featured'),
            ),

            Container(height: 20,),

            Container(
              height: 3 * (MediaQuery.of(context).size.height/2.5 + 20),
              child: ListView.builder(
                itemCount: 3,
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
