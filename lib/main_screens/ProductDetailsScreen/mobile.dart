import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:ning_web/Finalclass/finalclass.dart';
import 'package:ning_web/General/Product/Product.dart';
import 'package:ning_web/General/Tool/ChangeNumber.dart';
import 'package:ning_web/General/Tool/Compact.dart';
import 'package:ning_web/main_screens/Item/productItem/EvaluateItem.dart';
import 'package:ning_web/main_screens/Item/productItem/ProductImageItem.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ning_web/main_screens/ShopScreen/Screen.dart';
import 'package:ning_web/utils/utils.dart';
import '../../Button/Buttontype1.dart';
import '../EvaLuateDetail/MobileScreen.dart';
import '../Item/productItem/EvaluateMobiItem.dart';
import '../MainmenuScreen/mainMenuMobi.dart';
import '../MainmenuScreen/mainmenu.dart';
import '../ShopScreen/MobileScreen.dart';
import 'ItemImage.dart';
import 'mobileReview.dart';

class mobiDetailProduct extends StatefulWidget {
  final Product product;
  const mobiDetailProduct({Key? key, required this.product}) : super(key: key);

  @override
  State<mobiDetailProduct> createState() => _mobiDetailProductState();
}

class _mobiDetailProductState extends State<mobiDetailProduct> {
  String _currentImageUrl = "";
  int indexImage = 0;
  @override
  void initState() {
    _currentImageUrl = widget.product.url[0];
  }

  void _onItemSelected(String imageUrl) {
    // update the state to show the new image
    setState(() {
      _currentImageUrl = imageUrl;
    });
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    int Length = widget.product.evaluateList.length;
    if (Length > 3) {
      Length = 3;
    }

    Future<void> pushData1(List<Product> productList) async {
      final reference = FirebaseDatabase.instance.reference();
      for (int i = 0 ; i < productList.length ; i++) {
        await reference.child("Account/" + currentAccount.id + "/productCarts/" + i.toString()).set(productList[i].toJson());
      }
      setState(() {

      });
    }

    Future<void> pushData2(List<Product> productList) async {
      final reference = FirebaseDatabase.instance.reference();
      for (int i = 0 ; i < productList.length ; i++) {
        await reference.child("Account/" + currentAccount.id + "/wishList/" + i.toString()).set(productList[i].toJson());
      }
      setState(() {

      });
    }


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

              SizedBox(width: 5),

              Text(
                'PRODUCT',
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

        body: Stack(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration (
                color: Color.fromARGB(255, 242, 243, 248),
              ),

              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 10,
                    left: 10,
                    right: 10,
                    child: Container(
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

                          Container(
                            width: screenWidth/1.5,
                            child: Text(
                              widget.product.name,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              style: TextStyle(
                                  fontFamily: 'roboto',
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black,
                                  fontSize: screenWidth/24,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: 40,
                    left: 20,
                    right: 20,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: ListView(
                        children: [
                          Container(
                            height: 10,
                          ),

                          //Ảnh to
                          Container(
                            height: screenWidth - 40,
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  bottom: 100,
                                  child: Container(
                                    child: Image.network(
                                      _currentImageUrl,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),

                                Positioned(
                                  bottom: 10,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 80,
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                          top: 5,
                                          bottom: 5,
                                          left: 20,
                                          right: 20,
                                          child: Container(
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: widget.product.url.length,
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(right: 3),
                                                    child: Container(
                                                      width: (screenWidth - 40)/4,
                                                      height: 80,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                          border: Border.all(
                                                              width: 0.5,
                                                              color: indexImage != index ? Colors.grey.withOpacity(0.4) : Colors.deepOrange
                                                          )
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(3),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  fit: BoxFit.fitHeight,
                                                                  image: NetworkImage(widget.product.url[index])
                                                              )
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      indexImage = index;
                                                      _currentImageUrl = widget.product.url[index];
                                                    });
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),

                                        Positioned(
                                          top: 20,
                                          bottom: 20,
                                          right: 0,
                                          child: GestureDetector(
                                            child: Container(
                                              width: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(1000),
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
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            onTap: () {
                                              if (indexImage < widget.product.url.length - 1) {
                                                indexImage = indexImage + 1;
                                                _onItemSelected(widget.product.url[indexImage]);
                                              } else if (indexImage == widget.product.url.length - 1) {
                                                indexImage = 0;
                                                _onItemSelected(widget.product.url[indexImage]);
                                              }
                                            },
                                          ),
                                        ),

                                        Positioned(
                                          top: 20,
                                          bottom: 20,
                                          left: 0,
                                          child: GestureDetector(
                                            child: Container(
                                              width: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(1000),
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
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            onTap: () {
                                              if (indexImage > 0) {
                                                indexImage = indexImage - 1;
                                                _onItemSelected(widget.product.url[indexImage]);
                                              } else if (indexImage == 0) {
                                                indexImage = widget.product.url.length - 1;
                                                _onItemSelected(widget.product.url[indexImage]);
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ),

                          Container(
                            height: 25,
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.product.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: 'roboto',
                                    color: Color(0xff000000),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),

                          Container(
                            height: 12,
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              height: 15,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orangeAccent,
                                    size: 15,
                                  ),

                                  Container(width: 2,),

                                  Icon(
                                    Icons.star,
                                    color: Colors.orangeAccent,
                                    size: 15,
                                  ),

                                  Container(width: 2,),

                                  Icon(
                                    Icons.star,
                                    color: Colors.orangeAccent,
                                    size: 15,
                                  ),

                                  Container(width: 2,),

                                  Icon(
                                    Icons.star,
                                    color: Colors.orangeAccent,
                                    size: 15,
                                  ),

                                  Container(width: 2,),

                                  Icon(
                                    Icons.star,
                                    color: Colors.orangeAccent,
                                    size: 15,
                                  ),

                                  Container(width: 10,),

                                  Container(
                                    child: Text(
                                      '(10.000)',
                                      style: TextStyle(
                                          color: Colors.grey
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          Container(
                            height: 20,
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Container(
                              height: 0.7,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.4)
                              ),
                            ),
                          ),

                          Container(height: 20,),

                          //Phần shop
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              height: 50,
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => MobiShopScreen(shop: widget.product.shop)));
                                      },
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(1000),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.2), // màu của shadow
                                              spreadRadius: 5, // bán kính của shadow
                                              blurRadius: 7, // độ mờ của shadow
                                              offset: Offset(0, 3), // vị trí của shadow
                                            ),
                                          ],
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(widget.product.shop.url),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  Positioned(
                                    top: 5,
                                    left: 60,
                                    child: Container(
                                      child: Text(
                                        widget.product.shop.name,
                                        style: TextStyle(
                                            fontFamily: 'roboto',
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),

                                  Positioned(
                                    bottom: 5,
                                    left: 60,
                                    child: Container(
                                      child: Text(
                                        "Official Store",
                                        style: TextStyle(
                                            fontFamily: 'roboto',
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal
                                        ),
                                      ),
                                    ),
                                  ),

                                  Positioned(
                                    top: 10,
                                    bottom: 10,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => MobiShopScreen(shop: widget.product.shop)));
                                      },
                                      child: Icon(
                                        Icons.chevron_right,
                                        color: Colors.black.withOpacity(0.6),
                                        size: 30,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),

                          Container(height: 20,),

                          Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Container(
                              height: 0.7,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.4)
                              ),
                            ),
                          ),

                          Container(
                            height: 20,
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Giá sản phẩm: ',
                                style: TextStyle(
                                    fontFamily: 'roboto',
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal
                                ),
                              ),
                            ),
                          ),

                          Container(
                            height: 5,
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "\$. " + getStringNumber(widget.product.cost),
                                style: TextStyle(
                                    fontFamily: 'roboto',
                                    color: Color.fromARGB(255, 254, 58, 48),
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),

                          Container(height: 20,),

                          Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Container(
                              height: 0.7,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.4)
                              ),
                            ),
                          ),

                          Container(
                            height: 15,
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              height: 20,
                              alignment: Alignment.centerLeft,
                              child: LocaleText(
                                "sescription",
                                style: TextStyle(
                                    fontFamily: 'roboto',
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),

                          Container(
                            height: 10,
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Container(
                              decoration: BoxDecoration (
                                color: Colors.white,
                              ),
                              child: AutoSizeText(
                                widget.product.content,
                                style: TextStyle(
                                    fontFamily: 'roboto',
                                    color: Color.fromARGB(255, 12, 26, 48),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal
                                ),
                                maxLines: 20, // giới hạn số dòng của text
                                overflow: TextOverflow.ellipsis, // xử lý khi text bị tràn
                              ),
                            ),
                          ),

                          Container(
                            height: 40,
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Container(
                              height: 0.7,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.4)
                              ),
                            ),
                          ),

                          Container(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),

        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(

          ),

          child: Stack(
            children: <Widget>[
              Positioned(
                top: 10,
                left: 10,
                child: GestureDetector(
                  child: Container(
                    height: 50,
                    width: screenWidth/2 - 15,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(54, 105, 201, 1.0),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(
                        child: Row(
                          children: [
                            Container(width: 20,),

                            Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),

                            Container(width: 20,),

                            Text(
                              'Add to cart',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'roboto',
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                  onTap: () async {
                    if (currentAccount.productCarts.isNotEmpty) {
                      bool check = true;
                      for (int i = 0 ; i < currentAccount.productCarts.length ; i++) {
                        if (currentAccount.productCarts[i].id == widget.product.id) {
                          check = false;
                          break;
                        }
                      }
                      if (!check) {
                        toastMessage("Your cart have this product");
                      } else {
                        currentAccount.productCarts.add(widget.product);
                        await pushData1(currentAccount.productCarts);
                        toastMessage("Add success");
                      }
                    } else {
                      currentAccount.productCarts.add(widget.product);
                      await pushData1(currentAccount.productCarts);
                      toastMessage("Add success");
                    }
                  },
                ),
              ),

              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  child: Container(
                    height: 50,
                    width: screenWidth/2 - 15,
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(
                        child: Row(
                          children: [
                            Container(width: 20,),

                            Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),

                            Container(width: 20,),

                            Text(
                              'Add to wishlist',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'roboto',
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                  onTap: () async {
                    if (currentAccount.wishList.isNotEmpty) {
                      bool check = true;
                      for (int i = 0 ; i < currentAccount.wishList.length ; i++) {
                        if (currentAccount.wishList[i].id == widget.product.id) {
                          check = false;
                          break;
                        }
                      }
                      if (!check) {
                        toastMessage("Your wishlist was have this product");
                      } else {
                        currentAccount.wishList.add(widget.product);
                        await pushData2(currentAccount.productCarts);
                        toastMessage("Add success");
                      }
                    } else {
                      currentAccount.wishList.add(widget.product);
                      await pushData2(currentAccount.productCarts);
                      toastMessage("Add success");
                    }
                  },
                ),
              ),

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
