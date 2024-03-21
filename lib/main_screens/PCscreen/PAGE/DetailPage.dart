import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ning_web/Button/Buttontype1.dart';
import 'package:ning_web/General/Product/Product.dart';
import 'package:ning_web/General/Shop/Shop.dart';
import 'package:ning_web/General/Tool/ChangeNumber.dart';
import 'package:ning_web/main_screens/PCscreen/PAGE/shopviewPage.dart';

import '../../../Finalclass/finalclass.dart';
import '../../../utils/utils.dart';

class detailPage extends StatefulWidget {
  final Product product;
  final double width;
  final double height;
  const detailPage({Key? key, required this.product, required this.width, required this.height}) : super(key: key);

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  int indeximage = 0;
  String flashsale = 'Sản phẩm không thể áp dụng voucher';
  int selectIndex = 0;
  Shop currentShop = Shop(owner: currentAccount, id: '', url: '', name: '', followList: []);

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

  @override
  Widget build(BuildContext context) {
    if (selectIndex == 0) {
      if (widget.product.isSale) {
        flashsale = 'Sản phẩm có thể áp dụng voucher';
      }
      return Scaffold(
        body: Container(
          width: widget.width,
          height: widget.height,
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
                top: widget.height/12,
                left: 0,
                child: Container(
                  width: widget.width,
                  height: widget.height - widget.height/12,
                  child: ListView(
                    children: [
                      Container(
                        height: 50,
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: widget.width/10, right: widget.width/10),
                        child: Container(
                          height: widget.height/2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3), // màu của shadow
                                spreadRadius: 5, // bán kính của shadow
                                blurRadius: 7, // độ mờ của shadow
                                offset: Offset(0, 3), // vị trí của shadow
                              ),
                            ],
                          ),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: (widget.height/2 - widget.height/2.2)/2,
                                left: (widget.height/2 - widget.height/2.2)/2,
                                child: Container(
                                  height: widget.height/2.2,
                                  width: widget.height/2.2,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 225, 225, 226),
                                      image: DecorationImage(
                                          fit: BoxFit.fitHeight,
                                          image: NetworkImage(widget.product.url[indeximage])
                                      )
                                  ),
                                ),
                              ),

                              Positioned(
                                top: (widget.height/2 - widget.height/2.2)/2,
                                left: (widget.height/2 - widget.height/2.2)/2 + widget.height/2.2 + 20,
                                child: Container(
                                  width: widget.width/3*1.4,
                                  height: (widget.height/2.2)/5,
                                  decoration: BoxDecoration(

                                  ),

                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    widget.product.name,
                                    style: TextStyle(
                                        fontFamily: 'arial',
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                        fontSize: widget.width/60
                                    ),
                                  ),
                                ),
                              ),

                              Positioned(
                                top: (widget.height/2 - widget.height/2.2)/2 + (widget.height/2.2)/5 + 10,
                                left: (widget.height/2 - widget.height/2.2)/2 + widget.height/2.2 + 20,
                                child: Container(
                                  width: widget.width/3*1.4,
                                  height: (widget.height/2.2)/4,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 250, 250, 250),
                                  ),

                                  alignment: Alignment.topLeft,
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                        top: 15,
                                        left: 10,
                                        child: Text(
                                          '\$. ' + getStringNumber(widget.product.cost),
                                          style: TextStyle(
                                              fontSize: widget.width/40,
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'arial'
                                          ),
                                        ),
                                      ),

                                      Positioned(
                                        bottom: 15,
                                        left: 10,
                                        child: Text(
                                          flashsale,
                                          style: TextStyle(
                                              fontSize: widget.width/90,
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'arial'
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),

                              Positioned(
                                top: (widget.height/2 - widget.height/2.2)/2 + (widget.height/2.2)/5 + 10 + (widget.height/2.2)/4 + 30,
                                left: (widget.height/2 - widget.height/2.2)/2 + widget.height/2.2 + 20,
                                child: ButtonType1(Height: widget.width/30, Width: widget.width/8, color: Colors.deepOrange, radiusBorder: 0, title: 'Yêu thích', fontText: 'arial', colorText: Colors.white,
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
                                    }
                                ),
                              ),

                              Positioned(
                                top: (widget.height/2 - widget.height/2.2)/2 + (widget.height/2.2)/5 + 10 + (widget.height/2.2)/4 + 30,
                                left: (widget.height/2 - widget.height/2.2)/2 + widget.height/2.2 + 20 + widget.width/8 + 40,
                                child: ButtonType1(Height: widget.width/30, Width: widget.width/7, color: Color.fromARGB(255, 255, 245, 241), radiusBorder: 0, title: 'Thêm vào giỏ hàng', fontText: 'arial', colorText: Colors.deepOrange,
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
                                    }
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                      Container(
                        height: 60,
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: widget.width/10, right: widget.width/10),
                        child: Container(
                          height: widget.height/7,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3), // màu của shadow
                                spreadRadius: 5, // bán kính của shadow
                                blurRadius: 7, // độ mờ của shadow
                                offset: Offset(0, 3), // vị trí của shadow
                              ),
                            ],
                          ),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: (widget.height/7 - widget.height/9)/2,
                                left: 20,
                                child: Container(
                                  height: widget.height/9,
                                  width: widget.height/9,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(widget.height/18),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(widget.product.shop.url)
                                      )
                                  ),
                                ),
                              ),

                              Positioned(
                                top: (widget.height/7 - widget.height/9)/2 + 10,
                                left: 20 + widget.height/9 + 20,
                                child: Text(
                                  widget.product.shop.name,
                                  style: TextStyle(
                                      fontFamily: 'arial',
                                      fontSize: widget.width/70,
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal
                                  ),
                                ),
                              ),

                              Positioned(
                                  bottom: (widget.height/7 - widget.height/9)/2 + 10,
                                  left: 20 + widget.height/9 + 20,
                                  child: ButtonType1(Height: widget.height/25, Width: widget.height/8, color: Colors.deepOrange, radiusBorder: 0, title: 'Xem shop', fontText: 'arial', colorText: Colors.white,
                                      onTap: () {
                                          currentShop = widget.product.shop;
                                          selectIndex = 1;
                                          setState(() {

                                          });
                                      })
                              )

                            ],
                          ),
                        ),
                      ),

                      Container(
                        height: 60,
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: widget.width/10, right: widget.width/10),
                        child: Container(
                          height: widget.height/2 * 1.5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3), // màu của shadow
                                spreadRadius: 5, // bán kính của shadow
                                blurRadius: 7, // độ mờ của shadow
                                offset: Offset(0, 3), // vị trí của shadow
                              ),
                            ],
                          ),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 10,
                                left: 10,
                                child: Container(
                                  width: widget.width -  2 * widget.width/10 - 20,
                                  height: widget.height/20,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 250, 250, 250)
                                  ),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '   Thông tin sản phẩm',
                                    style: TextStyle(
                                      fontFamily: 'arial',
                                      fontSize: widget.width/65,
                                      color: Colors.black,

                                    ),
                                  ),
                                ),

                              ),

                              Positioned(
                                top: 10 + widget.height/20 + 10,
                                left: 10,
                                child: Container(
                                  width: widget.width -  2 * widget.width/10 - 20,
                                  height: widget.height/2 * 1.5 - widget.height/20 - 20,
                                  decoration: BoxDecoration(

                                  ),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "\n" + widget.product.content,
                                    style: TextStyle(
                                      fontFamily: 'arial',
                                      fontSize: widget.width/65,
                                      color: Colors.black,

                                    ),
                                  ),
                                ),

                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
    return shopviewPage(width: widget.width, height: widget.height, shop: currentShop);
  }
}
