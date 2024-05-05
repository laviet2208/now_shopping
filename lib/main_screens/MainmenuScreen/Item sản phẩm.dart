import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ning_web/General/Tool/ChangeNumber.dart';

import '../../Finalclass/finalclass.dart';
import '../../General/Product/Product.dart';
import '../../utils/utils.dart';
import '../Before_entering/signin_screen.dart';

class ItemSanPham extends StatefulWidget {
  final Product product;
  const ItemSanPham({Key? key, required this.product}) : super(key: key);

  @override
  State<ItemSanPham> createState() => _ItemSanPhamState();
}

class _ItemSanPhamState extends State<ItemSanPham> {
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
    double height = (MediaQuery.of(context).size.height/2.5) - (MediaQuery.of(context).size.height/2.5)/7;
    double width = (MediaQuery.of(context).size.width - 10 - 20)/2;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Colors.grey.withOpacity(0.4),
          width: 0.5,
        )
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: width/6*5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.product.url[0])
                )
              ),
            ),
          ),

          Positioned(
            top: width/6*5 + 2,
            left: 5,
            right: 5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '\$.' + getStringNumber(widget.product.cost),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: 'roboto',
                        color: Colors.redAccent,
                        fontSize: height/18,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),

                Container(height: 1,),

                Container(
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
                    ],
                  ),
                ),

                Container(height: 1,),

                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.product.name,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'roboto',
                        color: Colors.black,
                        fontSize: height/18,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 10,
            right: 5,
            child: GestureDetector(
              child: Container(
                width: 25,
                height: 25,
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
                    Icons.shopping_cart_outlined,
                    color: Colors.black.withOpacity(0.7),
                    size: 14,
                  ),
                ),
              ),
              onTap: () async {
                if (currentAccount.id != '') {
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

                      toastMessage("Add success");
                    }
                  } else {
                    currentAccount.productCarts.add(widget.product);

                    toastMessage("Add success");
                  }
                } else {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => SigninScreen(),),);
                }
              },
            ),
          ),

          Positioned(
            top: 45,
            right: 5,
            child: GestureDetector(
              child: Container(
                width: 25,
                height: 25,
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
                    Icons.favorite,
                    color: Colors.pinkAccent.withOpacity(0.7),
                    size: 14,
                  ),
                ),
              ),
              onTap: () async {
                if (currentAccount.id != '') {
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
                } else {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => SigninScreen(),),);
                }

              },
            ),
          ),
        ],
      ),
    );
  }
}
