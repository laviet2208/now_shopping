import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ning_web/Finalclass/finalclass.dart';
import 'package:ning_web/General/Product/Product.dart';
import 'package:ning_web/General/Tool/Compact.dart';
import 'package:ning_web/utils/utils.dart';

class MobiCartItemScreen extends StatefulWidget {
  final Product product;
  final double width;
  final double height;

  const MobiCartItemScreen({Key? key, required this.product, required this.width, required this.height}) : super(key: key);

  @override
  State<MobiCartItemScreen> createState() => _MobiCartItemScreenState();
}

class _MobiCartItemScreenState extends State<MobiCartItemScreen> {
  bool Value = false;
  int number = 0;

  Future<void> pushData() async {
    final reference = FirebaseDatabase.instance.reference();
    List<Product> productlist = currentAccount.productCarts;
    // Cập nhật productList
    productlist.remove(widget.product);
    await reference.child("Account/" + currentAccount.id + "/productCarts")
        .remove();
    for (int i = 0; i < productlist.length; i++) {
      await reference.child(
          "Account/" + currentAccount.id + "/productCarts/" + i.toString()).set(
          productlist[i].toJson());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
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
          //Tên shop
          Positioned(
            top: 2,
            left: 8,
            right: 8,
            child: Container(
              width: widget.width - 100,
              height: widget.height/ 5,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.black,
                          width: 2
                      )
                  )
              ),

              child: Text(
                "" + widget.product.shop.name,
                style: TextStyle(
                    fontFamily: 'Dmsan_regular',
                    color: Color(0xff3669c9),
                    fontSize: widget.width/20,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),

          //thêm sản phẩm
          Positioned(
            top:  widget.height/2,
            left: widget.width/8 + 2.8 * widget.height / 5 + widget.width/32,
            child: Container(
              width: 2.8 * widget.height / 5,
              height: 0.9 * widget.height / 5,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Colors.black
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), // màu của shadow
                    spreadRadius: 5, // bán kính của shadow
                    blurRadius: 7, // độ mờ của shadow
                    offset: Offset(0, 3), // vị trí của shadow
                  ),
                ],
              ),

              child: Stack(
                children: <Widget>[
                  //Trừ
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 0.9 * widget.height / 5,
                      height: 0.9 * widget.height / 5,
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            if (Value) {
                              toastMessage("Please un tick for change this number");
                            } else {
                              if (number > 0) {
                                number = number - 1;
                              }
                            }
                          });
                        },

                        child: Text(
                          "-",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ),
                  ),

                  //Cộng
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                        width: 0.9 * widget.height / 5,
                        height: 0.9 * widget.height / 5,
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              if (Value) {
                                toastMessage("Please un tick for change this number");
                              } else {
                                number = number + 1;
                              }
                            });
                          },

                          child: Text(
                            "+",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        )
                    ),
                  ),

                  Positioned(
                    top: 0,
                    left: 0.9 * widget.height / 5 + 1,
                    child: Container(
                      width: 2.8 * widget.height / 5 - 2*(0.9 * widget.height / 5 + 1),
                      height: 0.9 * widget.height / 5,
                      alignment: Alignment.center,
                      child: Text(
                        this.number.toString(),
                        style: TextStyle(
                            fontFamily: 'Dmsan_regular',
                            color: Color(0xff000000),
                            fontSize: widget.width/20,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          Positioned(
            top:  widget.height/2 + 4,
            left: widget.width/8 + 2.8 * widget.height / 5 + widget.width/32 + 2.8 * widget.height / 5 + 20,
            child: GestureDetector(
              onTap: () {
                pushData();
                toastMessage("this product was delete");
              },
              child: Container(
                width: 0.9 * widget.height / 7,
                height: 0.9 * widget.height / 7,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/icons/trash.png"),
                  ),
                ),
              ),
            ),
          ),

          //Checkbox
          Positioned(
              top: widget.width/4.5,
              left: 5,
              child: Container(
                height: widget.height/5,
                width: widget.height/5,
                child: Checkbox(
                  value: Value,
                  onChanged: (bool? value) {
                    setState(() {
                      if (Value) {
                        Value = !Value;
                        infoPay.money.value = infoPay.money.value - widget.product.cost * number;
                        cartProduct.removeWhere((p) => p.id == widget.product.id);
                        print("Đang tích -> Bỏ tích   " + cartProduct.length.toString());
                      } else {
                        if (number == 0) {
                          toastMessage("please add number of product before tick");
                        }
                        if (number > 0) {
                          for (int i = 0 ; i < number ; i++) {
                            cartProduct.add(widget.product);
                          }
                          infoPay.money.value = infoPay.money.value + widget.product.cost * number;
                          Value = !Value;
                        }
                        print("Chưa tích -> Tích  " + cartProduct.length.toString());
                      }
                    });
                  },
                ),
              )
          ),

          //ảnh đại diện
          Positioned(
            left: widget.width/8,
            top: widget.height/3.5,
            child: Container(
              height: 2.8 * widget.height / 5,
              width: 2.8 * widget.height / 5,
              decoration: BoxDecoration(
                // border: Border.all(
                //     color: Colors.deepOrange,
                //     width: 1
                // ),
              ),

              child: Image.network(
                widget.product.url[0],
                fit: BoxFit.cover,
              ),
            ),
          ),

          //Tên sản phẩm
          Positioned(
            left: widget.width/8 + 2.8 * widget.height / 5 + widget.width/32,
            top: widget.height/3.5,
            child: Container(
              alignment: Alignment.topLeft,
              height: 1.2 * widget.height / 5,
              width: widget.width - (widget.width/8 + 2.8 * widget.height / 5 + widget.width/16 + 5),
              child: Text(
                compactString(18, widget.product.name),
                style: TextStyle(
                    fontFamily: 'Dmsan_regular',
                    color: Color(0xff000000),
                    fontSize: widget.width/20,
                    fontWeight: FontWeight.normal
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

