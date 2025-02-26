import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ning_web/Finalclass/finalclass.dart';
import 'package:ning_web/General/Tool/GenerateID.dart';
import 'package:ning_web/General/bill/cartBill.dart';
import 'package:ning_web/main_screens/CartScreen/payment/selectVoucher.dart';
import 'package:ning_web/utils/utils.dart';

import '../../../Button/Buttontype1.dart';
import '../../../General/Product/Voucher.dart';
import '../../../General/Tool/ChangeNumber.dart';
import '../../Item/mobile/productItem.dart';
import '../../MainmenuScreen/mainMenuMobi.dart';
import '../../MainmenuScreen/mainmenu.dart';
import '../../VouvherScreen/MobiScreen.dart';
import 'mobivoucherselectitem.dart';

class PaymentScreenMobi extends StatefulWidget {
  const PaymentScreenMobi({Key? key}) : super(key: key);

  @override
  State<PaymentScreenMobi> createState() => _PaymentScreenMobiState();
}

class _PaymentScreenMobiState extends State<PaymentScreenMobi> {
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
                  'PAYMENT',
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

          body: Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration (
              color: Color(0xfff5f5f5),
            ),

            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0.02 * screenHeight,
                  left: 0.01 * screenWidth,
                  child: Container(
                    width: screenWidth * 0.98,
                    height: 0.91 * screenHeight,
                    child: ListView(
                      children: [
                        Container(
                          height: 5,
                        ),

                        GestureDetector(
                          onTap: () {
                            infoPay.money.value = 0;
                            cartProduct.clear();
                            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => MainMenuScreen()));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: screenWidth/15*14),
                            child: Container(
                              width: screenWidth/15,
                              height: screenWidth/15,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('assets/lefticon.png')
                                  )
                              ),
                            ),
                          ),
                        ),

                        Container(
                          height: 10,
                        ),

                        Text(
                            "Your Location",
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Dmsan_regular',
                                fontSize: screenWidth / 18,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1
                            )
                        ),

                        Container(height: 10,),

                        Container(
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.07,
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

                        Container(height: 10,),

                        Text(
                            "Your Phone",
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Dmsan_regular',
                                fontSize: screenWidth / 18,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1
                            )
                        ),

                        Container(height: 10,),

                        Container(
                          width: screenWidth * 0.9,
                          height: screenHeight * 0.07,
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

                        Container(height: 20,),

                        Text(
                            "Your Cart : " + cartProduct.length.toString() + " Products" ,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Dmsan_regular',
                                fontSize: screenWidth / 18,
                                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1
                            )
                        ),

                        Container(height: 10,),


                        Container(
                          height: 248,
                          decoration: BoxDecoration(
                              color: Colors.white
                          ),

                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: cartProduct.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                                child: InkWell(
                                  onTap: () {

                                  },
                                  child: ProductItemMobiWidget(product: cartProduct[index]),
                                ),
                              );
                            },
                          ),
                        ),

                        Container(height: 400,),

                      ],
                    ),
                  ),
                ),

                //Phần tặng quà
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Container(
                    height: screenWidth/1.8,
                    width: screenHeight*0.98,
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
                                    fontSize: screenHeight*0.025,
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
                                    fontSize: screenHeight*0.025,
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
                                    fontSize: screenHeight*0.025,
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
                          child: ButtonType1(Height: screenHeight * 0.07, Width: screenWidth * 0.3, color: Colors.deepOrange, radiusBorder: 10, title: "Select voucher", fontText: 'Dmsan_regular', colorText: Colors.white,
                            onTap: () async {
                              voucherBuySelect.clear();
                              voucherBuymoney = 0;
                              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => VoucherScreenslMobi()));
                            },),
                        ),

                        //Payment button
                        Positioned(
                          top: screenHeight/20 + screenHeight * 0.13,
                          left: 20 + screenWidth * 0.3,
                          child: ButtonType1(Height: screenHeight * 0.07, Width: screenWidth * 0.3, color: Colors.green, radiusBorder: 10, title: "Payment", fontText: 'Dmsan_regular', colorText: Colors.white,
                            onTap: () async {

                              if (Location.text.toString().isEmpty || sdt.text.isEmpty)  {
                                toastMessage("you can fill your location");
                              } else {
                                if (totalmoney > currentAccount.totalMoney) {
                                  toastMessage("you don't have enough money");
                                } else {
                                  if (voucherBuySelect.isNotEmpty) {
                                    currentAccount.voucherList.remove(voucherBuySelect[0]);
                                    await pushData1(currentAccount.voucherList);
                                    infoPay.money.value = 0;
                                    cartProduct.clear();
                                  }

                                  cartBill cart = cartBill(generateID(12), currentAccount, cartProduct, totalmoney, "U", Location.text.toString(), sdt.text.toString());
                                  print(cartProduct.length.toString() + "  vvvvvvvvv");
                                  await pushBill(cart);
                                  currentAccount.totalMoney = currentAccount.totalMoney - totalmoney;
                                  await pushMonmey();
                                  voucherBuymoney = 0;
                                  toastMessage("Buy success");
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => MainmenuMobi()));
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
        ),
        onWillPop: () async {
          return false;
        });
  }
}
