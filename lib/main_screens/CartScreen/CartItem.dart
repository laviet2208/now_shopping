import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ning_web/General/Tool/ChangeNumber.dart';
import '../../Finalclass/finalclass.dart';
import '../../General/Product/Product.dart';
import '../../utils/utils.dart';

class CartItem extends StatefulWidget {
  final Product product;
  const CartItem({Key? key, required this.product}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int number = 0;
  bool Value = false;

  Future<void> pushData() async {
    final reference = FirebaseDatabase.instance.ref();
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
    double width = MediaQuery.of(context).size.width - 30;
    double height = MediaQuery.of(context).size.height/4;
    return Container(
      width: width,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 15,
            right: 15,
            child: Container(
              height: 0.5,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.6)
              ),
            ),
          ),

          Positioned(
            top: 20,
            left: 10,
            child: Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.product.url[0])
                )
              ),
            ),
          ),

          Positioned(
            top: 20,
            left: 90,
            right: 15,
            child: Container(
              child: Text(
                widget.product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey.withOpacity(0.8),
                  fontFamily: 'roboto',
                  fontSize: 15,
                ),
              ),
            ),
          ),

          Positioned(
            top: 90,
            left: 10,
            right: 15,
            child: Container(
              child: Row(
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle (
                        fontFamily: 'roboto',
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: 'Giá bán\n',
                        ),
                        TextSpan(
                            text: 'usd. ',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontFamily: 'roboto',
                            )
                        ),

                        TextSpan(
                          text: getStringNumber(widget.product.cost),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontFamily: 'roboto',
                            fontWeight: FontWeight.bold
                          )
                        )
                      ],
                    ),
                  ),

                  Container(width: 20,),

                  RichText(
                    text: TextSpan(
                      style: TextStyle (
                        fontFamily: 'roboto',
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: 'Thuế\n',
                        ),
                        TextSpan(
                            text: 'usd. ',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontFamily: 'roboto',
                            )
                        ),

                        TextSpan(
                            text: '0.00',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontFamily: 'roboto',
                                fontWeight: FontWeight.bold
                            )
                        )
                      ],
                    ),
                  ),

                  Container(width: 20,),

                  RichText(
                    text: TextSpan(
                      style: TextStyle (
                        fontFamily: 'roboto',
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: 'Tổng cộng\n',
                        ),
                        TextSpan(
                            text: 'usd. ',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.red,
                              fontFamily: 'roboto',
                            )
                        ),

                        TextSpan(
                            text: getStringNumber(widget.product.cost * number),
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.red,
                                fontFamily: 'roboto',
                                fontWeight: FontWeight.bold
                            )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 10,
            left: 10,
            child: GestureDetector(
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(1000)
                ),
                alignment: Alignment.center,
                child: Text(
                  '-',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'roboto',
                    fontSize: 20
                  ),
                )
              ),
              onTap: () {
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
            ),
          ),

          Positioned(
              top: 50,
              right: 10,
              child: Container(
                height: 10,
                width: 10,
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

          Positioned(
            bottom: 15,
            left: 60,
            child: Container(
              child: Text(
                number.toString(),
                style: TextStyle(
                  fontFamily: 'roboto',
                  fontSize: 20,
                  color: Colors.black
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 10,
            left: 90,
            child: GestureDetector(
              child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(1000)
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '+',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'roboto',
                        fontSize: 20
                    ),
                  )
              ),
              onTap: () {
                setState(() {
                  if (Value) {
                    toastMessage("Please un tick for change this number");
                  } else {
                    number = number + 1;
                  }
                });
              },
            ),
          ),

          Positioned(
            bottom: 10,
            right: 10,
            child: GestureDetector(
              child: Container(
                child: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                  size: 20,
                ),
              ),
              onTap: () {
                currentAccount.productCarts.remove(widget.product);
                toastMessage("this product was delete");
              },
            ),
          )
        ],
      ),
    );
  }
}
