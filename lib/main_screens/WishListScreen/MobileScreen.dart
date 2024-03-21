import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:ning_web/Finalclass/finalclass.dart';

import '../Item/mobile/productItem.dart';
import '../MainmenuScreen/Item sản phẩm.dart';
import '../MainmenuScreen/mainMenuMobi.dart';
import '../ProductDetailsScreen/mobile.dart';
import '../ProductDetailsScreen/productDetailScreen.dart';

class WishlistMobiScreen extends StatefulWidget {
  const WishlistMobiScreen({Key? key}) : super(key: key);

  @override
  State<WishlistMobiScreen> createState() => _WishlistMobiScreen();
}

class _WishlistMobiScreen extends State<WishlistMobiScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double baseWidth = 1920;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.9;


    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration (
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
                  LocaleText(
                    'wishlist',
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
                child: GridView.builder(
                  itemCount: currentAccount.wishList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // số phần tử trên mỗi hàng
                    mainAxisSpacing: 10, // khoảng cách giữa các hàng
                    crossAxisSpacing: 10, // khoảng cách giữa các cột
                    childAspectRatio: 0.7, // tỷ lệ chiều rộng và chiều cao
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: ItemSanPham(product: currentAccount.wishList[index]),
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => mobiDetailProduct(product: currentAccount.wishList[index]),),);
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}
