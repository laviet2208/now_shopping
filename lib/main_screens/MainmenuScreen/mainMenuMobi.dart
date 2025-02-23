import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:ning_web/General/Product/Product.dart';
import 'package:ning_web/General/Tool/ChangeNumber.dart';
import 'package:ning_web/main_screens/MainmenuScreen/mainMenuTab.dart';
import 'package:ning_web/main_screens/ProductDetailsScreen/productDetailScreen.dart';
import '../../Finalclass/finalclass.dart';
import '../CartScreen/MobileScreen.dart';
import '../InfoScreen/mainSetting.dart';
import '../InfoScreen/mainSettingMobi.dart';
import '../Item/mobile/productItem.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../WishListScreen/MobileScreen.dart';

class MainmenuMobi extends StatefulWidget {

  const MainmenuMobi({Key? key}) : super(key: key);

  @override
  State<MainmenuMobi> createState() => _MainmenuMobiState();
}

class _MainmenuMobiState extends State<MainmenuMobi> {
  List<Product> dataFearture = [];
  List<Product> dataFlashSale = [];
  List<Product> dataFiveStar = [];
  final databaseReference = FirebaseDatabase.instance.reference();
  int selectedIndex = 0; // Giá trị mặc định là 0

  void getFeaturedData() {
    final reference = FirebaseDatabase.instance.reference();
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
      setState(() {});
    });
  }

  Widget getBodyWidget() {
    // Dựa vào selectedIndex, trả về phần body tương ứng
    switch (selectedIndex) {
      case 0:
        return mainmenuTab();
      case 1:
        return CartMobiScreen();
      case 2:
        return WishlistMobiScreen();
      case 3:
        return settingMobi();
      default:
        return Container();
    }
  }


  @override
  void initState() {
    super.initState();
    getFeaturedData();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double baseWidth = 1920;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    String home = "";


    return WillPopScope(
        child: Scaffold(
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
              ],
            ),
          ),

          body: getBodyWidget(),

          bottomNavigationBar: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: GNav(
                backgroundColor: Colors.white,
                color: Colors.black,
                activeColor: Color.fromARGB(255, 54, 105, 201),
                tabBackgroundColor: Color.fromARGB(100, 200, 225, 252),
                gap: 8,
                onTabChange: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },

                padding: EdgeInsets.all(12),
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: ("Home"),
                  ),

                  GButton(
                    icon: Icons.shopping_cart,
                    text: ("My cart"),
                  ),

                  GButton(
                    icon: Icons.favorite,
                    text: ("Wish list"),
                  ),

                  GButton(
                    icon: Icons.account_circle_sharp,
                    text: ("My account"),
                  ),
                ],
              ),
            ),
          ),
        ),
        onWillPop: () async {
          return false;
        }
        );

  }
}
