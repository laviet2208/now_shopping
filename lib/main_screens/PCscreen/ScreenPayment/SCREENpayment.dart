import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../Button/Buttontype1.dart';
import '../../../Finalclass/finalclass.dart';
import '../../../General/Product/Voucher.dart';
import '../../../General/Tool/ChangeNumber.dart';
import '../../../General/Tool/GenerateID.dart';
import '../../../General/bill/cartBill.dart';
import '../../../utils/utils.dart';
import '../../CartScreen/payment/selectVoucher.dart';
import '../../Item/mobile/productItem.dart';
import '../Screenmain/SCREENmain.dart';
import '../screenSelectvoucher/ScreenvoucherSelect.dart';

class SCREENpayment extends StatefulWidget {
  const SCREENpayment({Key? key}) : super(key: key);

  @override
  State<SCREENpayment> createState() => _SCREENpaymentState();
}

class _SCREENpaymentState extends State<SCREENpayment> {
  TextEditingController Location = TextEditingController();
  TextEditingController sdt = TextEditingController();


  bool loading = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double voucherBuymoney = 0;
    double totalmoney = 0;
    if (voucherBuySelect.isNotEmpty) {
      voucherBuymoney = voucherBuySelect[0].totalMoney;
    }

    totalmoney = infoPay.money.value - voucherBuymoney;
    if (totalmoney < 0) {
      totalmoney = 0;
    }

    Future<void> pushData1(List<voucher> voucherList) async {
      final reference = FirebaseDatabase.instance.ref();
      // Cập nhật voucherList
      await reference.child("Account/" + currentAccount.id + "/voucherList").remove();
      for (int i = 0 ; i < voucherList.length ; i++) {
        await reference.child("Account/" + currentAccount.id + "/voucherList/" + i.toString()).set(voucherList[i].toJson());
      }
    }

    Future<void> pushMonmey() async {
      final reference = FirebaseDatabase.instance.ref();
      await reference.child("Account/" + currentAccount.id + "/total_money").set(currentAccount.totalMoney);
    }

    Future<void> pushBill(cartBill bill) async {
      final reference = FirebaseDatabase.instance.ref();
      await reference.child("cartBill/" + bill.ID).set(bill.toJson());
    }


    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration (
          color: Color(0xfff5f5f5),
        ),

        child: Stack(
          children: <Widget>[
            Positioned(
              top: screenHeight/40,
              left: screenWidth/3,
              child: Container(
                height: screenHeight - screenHeight/20,
                width: screenWidth/3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    color: Colors.black
                  ),
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
                      top: 0,
                      left: 0,
                      child: Container(
                        height: screenHeight - screenHeight/20,
                        width: screenWidth/3,
                        child: ListView(
                          children: [
                            Container(height: 15,),

                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                  "Your Location",
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontFamily: 'Dmsan_regular',
                                      fontSize: screenWidth / 120,
                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1
                                  )
                              ),
                            ),

                            Container(height: 10,),

                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Container(
                                width: screenWidth * 0.9,
                                height: screenHeight * 0.05,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: Colors.black
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(209, 209, 209, 1),
                                ),
                                child: TextFormField(
                                  controller: Location,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Dmsan_regular',
                                    //Thêm textAlignVertical vào TextStyle
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Your Location',
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dmsan_regular',
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20), //Xóa contentVerticalAlignment trong InputDecoration
                                  ),
                                ),
                              ),
                            ),

                            Container(height: 15,),

                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                  "Your Phone",
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontFamily: 'Dmsan_regular',
                                      fontSize: screenWidth / 120,
                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1
                                  )
                              ),
                            ),

                            Container(height: 10,),

                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Container(
                                width: screenWidth * 0.9,
                                height: screenHeight * 0.05,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1,
                                      color: Colors.black
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromRGBO(209, 209, 209, 1),
                                ),
                                child: TextFormField(
                                  controller: sdt,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Dmsan_regular',
                                    //Thêm textAlignVertical vào TextStyle
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Your Phone',
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Dmsan_regular',
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20), //Xóa contentVerticalAlignment trong InputDecoration
                                  ),
                                ),
                              ),
                            ),

                            Container(height: 25,),

                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                  "Your Cart : " + cartProduct.length.toString() + " Products",
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontFamily: 'Dmsan_regular',
                                      fontSize: screenWidth / 120,
                                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                      fontWeight: FontWeight.normal,
                                      height: 1
                                  )
                              ),
                            ),

                            Container(height: 25,),

                            Padding(
                              padding: EdgeInsets.only(left: 10,right: 10),
                              child: Container(
                                height: 248,
                                decoration: BoxDecoration(
                                    color: Colors.white
                                ),

                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: cartProduct.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                                      child: InkWell(
                                        onTap: () {

                                        },
                                        child: ProductItemMobiWidget(product: cartProduct[index]),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    //Phần tặng quà
                    Positioned(
                      left: 5,
                      bottom: 5,
                      child: Container(
                        height: (screenHeight - screenHeight/20)/4,
                        width: screenWidth/3 - 15,
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
                              left: 3,
                              top: 3,
                              child: Text(
                                "Paymen Infomation",
                                style: TextStyle(
                                  fontSize: screenHeight*0.025,
                                  fontFamily: 'Dmsan_regular',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ),

                            Positioned(
                                left: 3,
                                top: screenHeight/25,
                                child: ValueListenableBuilder<double>(
                                  valueListenable: infoPay.money,
                                  builder: (BuildContext context, double value, Widget? child) {
                                    return Text(
                                      "+) Total money : \$. " + getStringNumber(value),
                                      style: TextStyle(
                                        fontSize: screenHeight*0.02,
                                        fontFamily: 'Dmsan_regular',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange,
                                      ),
                                    );
                                  },
                                )
                            ),

                            Positioned(
                                left: 3,
                                top: screenHeight/12,
                                child: ValueListenableBuilder<double>(
                                  valueListenable: infoPay.money,
                                  builder: (BuildContext context, double value, Widget? child) {
                                    return Text(
                                      "+) Voucher sale : - \$. " + getStringNumber(voucherBuymoney),
                                      style: TextStyle(
                                        fontSize: screenHeight*0.02,
                                        fontFamily: 'Dmsan_regular',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
                                      ),
                                    );
                                  },
                                )
                            ),

                            Positioned(
                                left: 3,
                                top: screenHeight/8,
                                child: ValueListenableBuilder<double>(
                                  valueListenable: infoPay.money,
                                  builder: (BuildContext context, double value, Widget? child) {
                                    return Text(
                                      "+) Final money : \$. " + getStringNumber(totalmoney),
                                      style: TextStyle(
                                        fontSize: screenHeight*0.02,
                                        fontFamily: 'Dmsan_regular',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    );
                                  },
                                )
                            ),


                            //choose voucher button
                            Positioned(
                              top: screenHeight/20 + screenHeight * 0.13,
                              left: 10,
                              child: ButtonType1(Height: screenHeight * 0.05, Width: screenWidth * 0.12, color: Colors.deepOrange, radiusBorder: 10, title: "Select voucher", fontText: 'Dmsan_regular', colorText: Colors.white,
                                onTap: () async {
                                  voucherBuySelect.clear();
                                  voucherBuymoney = 0;
                                  setState(() {

                                  });
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Screenselectvoucherpc()));
                                },),
                            ),

                            //Payment button
                            Positioned(
                              top: screenHeight/20 + screenHeight * 0.13,
                              left: 20 + screenWidth * 0.12,
                              child: ButtonType1(Height: screenHeight * 0.05, Width: screenWidth * 0.12, color: Colors.green, radiusBorder: 10, title: "Payment", fontText: 'Dmsan_regular', colorText: Colors.white,
                                onTap: () async {

                                  if (Location.text.toString().isEmpty || sdt.text.isEmpty)  {
                                    toastMessage("you can fill your location");
                                  } else {
                                    if (totalmoney > currentAccount.totalMoney) {
                                      toastMessage("you don't have enough money");
                                    } else {
                                      setState(() {
                                        loading = true;
                                      });

                                      if (voucherBuySelect.isNotEmpty) {
                                        currentAccount.voucherList.remove(voucherBuySelect[0]);
                                        await pushData1(currentAccount.voucherList);
                                        voucherBuySelect.clear();
                                      }

                                      cartBill cart = cartBill(generateID(12), currentAccount, cartProduct, totalmoney, "U", Location.text.toString(), sdt.text.toString());
                                      print(cartProduct.length.toString() + "  vvvvvvvvv");
                                      await pushBill(cart);
                                      currentAccount.totalMoney = currentAccount.totalMoney - totalmoney;
                                      await pushMonmey();
                                      voucherBuymoney = 0;
                                      toastMessage("Buy success");
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => Screenmainpc()));
                                    }
                                  }

                                },loading: loading,),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
