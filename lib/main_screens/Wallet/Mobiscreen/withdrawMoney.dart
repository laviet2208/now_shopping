import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ning_web/Finalclass/finalclass.dart';
import 'package:ning_web/General/TimeAndID/Time.dart';
import 'package:ning_web/General/Tool/GenerateID.dart';
import 'package:ning_web/utils/utils.dart';

import '../../../Button/Buttontype1.dart';
import '../../../General/bill/withDrawBill.dart';

class withdrawMobile extends StatefulWidget {
  const withdrawMobile({Key? key}) : super(key: key);

  @override
  State<withdrawMobile> createState() => _withdrawMobileState();
}

class _withdrawMobileState extends State<withdrawMobile> {
  TextEditingController cardnum = TextEditingController();
  TextEditingController cardname = TextEditingController();
  TextEditingController bankname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController money = TextEditingController();

  Future<void> pushData(withDrawBill bill) async {
    final reference = FirebaseDatabase.instance.reference();
    await reference.child("withdraw/" + bill.ID).set(bill.toJson());
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    bool loading = false;
    return Scaffold(
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
              'N-iNG',
              style: TextStyle(
                fontFamily: "logo_font_1",
                fontSize: screenWidth/19.65,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),

            SizedBox(width: 5),

            Text(
              'WITHDRAW',
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

      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
            color: Colors.white
        ),

        child: Stack(
          children: <Widget>[
            Positioned(
                top: screenHeight * 0.03,
                left: screenHeight / 165 + 6,
                child: Text('Tokens', textAlign: TextAlign.left, style: TextStyle(
                    color: Colors.redAccent,
                    fontFamily: 'arial',
                    fontSize: 18,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),)
            ),

            Positioned(
              top: screenHeight * 0.07,
              left: screenHeight / 165 + 6,
              child: Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // màu của shadow
                      spreadRadius: 5, // bán kính của shadow
                      blurRadius: 7, // độ mờ của shadow
                      offset: Offset(0, 3), // vị trí của shadow
                    ),
                  ],
                  border: Border.all(
                      width: 1,
                      color: Colors.deepOrange
                  ),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: TextFormField(
                  controller: cardnum,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter your token";
                    }
                    return null;
                  },
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'arial',
                    //Thêm textAlignVertical vào TextStyle
                  ),
                  decoration: InputDecoration(
                    hintText: 'Your token',
                    hintStyle: TextStyle(
                      color: Colors.pinkAccent,
                      fontFamily: 'arial',
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    isDense: true,
                    //Xóa contentVerticalAlignment trong InputDecoration
                  ),
                ),
              ),
            ),

            Positioned(
                top: screenHeight * 0.16,
                left: screenHeight / 165 + 6,
                child: Text('Withdrawal network', textAlign: TextAlign.left, style: TextStyle(
                    color: Colors.redAccent,
                    fontFamily: 'arial',
                    fontSize: 18,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),)
            ),

            Positioned(
              top: screenHeight * 0.2,
              left: screenHeight / 165 + 6,
              child: Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // màu của shadow
                      spreadRadius: 5, // bán kính của shadow
                      blurRadius: 7, // độ mờ của shadow
                      offset: Offset(0, 3), // vị trí của shadow
                    ),
                  ],
                  border: Border.all(
                      width: 1,
                      color: Colors.deepOrange
                  ),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: TextFormField(
                  controller: cardname,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Withdrawal network";
                    }
                    return null;
                  },
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'arial',
                    //Thêm textAlignVertical vào TextStyle
                  ),
                  decoration: InputDecoration(
                    hintText: 'Withdrawal network',
                    hintStyle: TextStyle(
                      color: Colors.pinkAccent,
                      fontFamily: 'arial',
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    isDense: true,
                    //Xóa contentVerticalAlignment trong InputDecoration
                  ),
                ),
              ),
            ),

            Positioned(
                top: screenHeight * 0.29,
                left: screenHeight / 165 + 6,
                child: Text('Withdrawal address', textAlign: TextAlign.left, style: TextStyle(
                    color: Colors.redAccent,
                    fontFamily: 'arial',
                    fontSize: 18,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),)
            ),

            Positioned(
              top: screenHeight * 0.32,
              left: screenHeight / 165 + 6,
              child: Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // màu của shadow
                      spreadRadius: 5, // bán kính của shadow
                      blurRadius: 7, // độ mờ của shadow
                      offset: Offset(0, 3), // vị trí của shadow
                    ),
                  ],
                  border: Border.all(
                      width: 1,
                      color: Colors.deepOrange
                  ),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: TextFormField(
                  controller: bankname,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Bank name";
                    }
                    return null;
                  },
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'arial',
                    //Thêm textAlignVertical vào TextStyle
                  ),
                  decoration: InputDecoration(
                    hintText: 'Withdrawal address',
                    hintStyle: TextStyle(
                      color: Colors.pinkAccent,
                      fontFamily: 'arial',
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    isDense: true,
                    //Xóa contentVerticalAlignment trong InputDecoration
                  ),
                ),
              ),
            ),

            Positioned(
                top: screenHeight * 0.42,
                left: screenHeight / 165 + 6,
                child: Text('Password', textAlign: TextAlign.left, style: TextStyle(
                    color: Colors.redAccent,
                    fontFamily: 'arial',
                    fontSize: 18,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),)
            ),

            Positioned(
              top: screenHeight * 0.45,
              left: screenHeight / 165 + 6,
              child: Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // màu của shadow
                      spreadRadius: 5, // bán kính của shadow
                      blurRadius: 7, // độ mờ của shadow
                      offset: Offset(0, 3), // vị trí của shadow
                    ),
                  ],
                  border: Border.all(
                      width: 1,
                      color: Colors.deepOrange
                  ),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: TextFormField(
                  controller: password,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Password";
                    }
                    return null;
                  },
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'arial',
                    //Thêm textAlignVertical vào TextStyle
                  ),
                  decoration: InputDecoration(
                    hintText: '**********',
                    hintStyle: TextStyle(
                      color: Colors.pinkAccent,
                      fontFamily: 'arial',
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    isDense: true,
                    //Xóa contentVerticalAlignment trong InputDecoration
                  ),
                ),
              ),
            ),

            Positioned(
                top: screenHeight * 0.55,
                left: screenHeight / 165 + 6,
                child: Text('Amount of money', textAlign: TextAlign.left, style: TextStyle(
                    color: Colors.redAccent,
                    fontFamily: 'arial',
                    fontSize: 18,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),)
            ),

            Positioned(
              top: screenHeight * 0.58,
              left: screenHeight / 165 + 6,
              child: Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.07,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // màu của shadow
                      spreadRadius: 5, // bán kính của shadow
                      blurRadius: 7, // độ mờ của shadow
                      offset: Offset(0, 3), // vị trí của shadow
                    ),
                  ],
                  border: Border.all(
                      width: 1,
                      color: Colors.deepOrange
                  ),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: TextFormField(
                  controller: money,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter money";
                    }
                    return null;
                  },
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'arial',
                    //Thêm textAlignVertical vào TextStyle
                  ),
                  decoration: InputDecoration(
                    hintText: 'Ex : 100',
                    hintStyle: TextStyle(
                      color: Colors.pinkAccent,
                      fontFamily: 'arial',
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    isDense: true,
                    //Xóa contentVerticalAlignment trong InputDecoration
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: screenHeight * 0.1,
              left: screenHeight / 165 + 6,
              child: ButtonType1(Height: screenHeight * 0.062 , Width: screenWidth * 0.9, color: Color.fromRGBO(255, 49, 49, 1), radiusBorder: 10, title: "Complete", fontText: 'Dmsan_regular', colorText: Colors.white,
                onTap: () async {
                   if (cardnum.text.isEmpty || cardname.text.isEmpty || bankname.text.isEmpty || password.text.isEmpty || money.text.isEmpty) {
                     toastMessage("All of infomation must be fill");
                   } else {
                     if (double.parse(money.text.toString()) > currentAccount.totalMoney) {
                       toastMessage("You don't have enough money");
                     } else {
                       if(password.text.toString() != currentAccount.password) {
                         toastMessage("Password Incorrect");
                       } else {
                         setState(() {
                           loading = true;
                         });
                         DateTime now = DateTime.now();
                         withDrawBill bill = withDrawBill(generateID(15), currentAccount, cardnum.text.toString(), cardname.text.toString(), bankname.text.toString(),
                             Time(second: now.second, minute: now.minute, hour: now.hour, day: now.day, month: now.month, year: now.year), double.parse(money.text.toString()));
                         await pushData(bill);
                         setState(() {
                           loading = false;
                           toastMessage("withdraw request success");
                           cardnum.clear();
                           cardname.clear();
                           bankname.clear();
                           password.clear();
                           money.clear();
                         });
                       }
                     }
                   }
                },loading: loading,
              ),
            ),


          ],
        ),
      ),
    );
  }
}
