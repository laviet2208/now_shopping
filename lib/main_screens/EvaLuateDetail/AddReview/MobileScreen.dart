
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ning_web/Finalclass/finalclass.dart';
import 'package:ning_web/General/Product/Evaluate.dart';
import 'package:ning_web/utils/utils.dart';

import '../../../Button/Buttontype1.dart';
import '../../../General/Product/Product.dart';
import '../../MainmenuScreen/mainMenuMobi.dart';

class AddreviewMobi extends StatefulWidget {
  final Product product;

  const AddreviewMobi({Key? key, required this.product}) : super(key: key);

  @override
  State<AddreviewMobi> createState() => _AddreviewMobiState();
}

class _AddreviewMobiState extends State<AddreviewMobi> {
  int number = 5;
  bool loading = false;
  TextEditingController content = TextEditingController();

  Future<void> pushData() async {
    final reference = FirebaseDatabase.instance.reference();
    // Cập nhật voucherList
    for (int i = 0 ; i < widget.product.evaluateList.length ; i++) {
      await reference.child("product/" + widget.product.id + "/evaluateList/" + i.toString()).set(widget.product.evaluateList[i].toJson());
    }

    // await reference.child("Account/" + idRece + "/voucherList").push().set(voucherList.map((voucher) => voucher.toJson()).toList());
  }


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: screenHeight/100,
                left: 0,
                child: Container(
                  width: screenWidth,
                  height: 0.07 * screenHeight,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xff3669c9),
                        width: 2.0, // Độ dày của viền
                      ),
                    ),
                  ),
                  child: Text(
                    "N-Ing Shop / Add review",
                    style: TextStyle(
                        fontFamily: 'Dmsan_regular',
                        color: Color(0xff3669c9),
                        fontSize: screenWidth/15,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
            ),

            Positioned(
              top: screenWidth/5,
              left: (screenWidth - 0.65 * screenWidth) / 2 + 40,
              child: Container(
                height: 0.25 * screenWidth,
                width: 0.25 * screenWidth,
                decoration: BoxDecoration(
                ),

                child: Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2FStar%2Fst.png?alt=media&token=9fc639b2-51e5-4d85-861e-768319b92592",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),

            Positioned(
              top: screenWidth/5,
              left: (screenWidth - 0.65 * screenWidth) / 2 + 0.25 * screenWidth + 50,
              child: Container(
                height: 0.25 * screenWidth,
                width: 0.25 * screenWidth,
                decoration: BoxDecoration(
                ),

                child: Text(
                  number.toString(),
                  style: TextStyle(
                      fontFamily: 'Dmsan_regular',
                      color: Color(0xff3669c9),
                      fontSize: screenWidth/5,
                      fontWeight: FontWeight.bold
                  ),
                )
              ),
            ),



            Positioned(
              top: screenWidth/1.8,
              left: screenWidth/3,
              child: GestureDetector(
                onTap: () {
                  if (number > 1) {
                    number = number - 1;
                    print(number.toString());
                  }
                  setState(() {});
                },
                child: Container(
                  height: 0.15 * screenWidth,
                  width: 0.15 * screenWidth,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width: 1
                      )
                  ),
                  child: Image.network(
                    "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2FStar%2Fangle_small_left.png?alt=media&token=cb9a31d9-cf72-4306-ad95-c73bf375a947",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Positioned(
              top: screenWidth/1.8,
              right: screenWidth/3,
              child: GestureDetector(
                onTap: () {
                  if (number < 5) {
                    number = number + 1;
                    print(number.toString());
                  }
                  setState(() {});
                },
                child: Container(
                  height: 0.15 * screenWidth,
                  width: 0.15 * screenWidth,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          width: 1
                      )
                  ),
                  child: RotatedBox(
                    quarterTurns: 2, // 180 độ
                    child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2FStar%2Fangle_small_left.png?alt=media&token=cb9a31d9-cf72-4306-ad95-c73bf375a947",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: screenHeight/2.7,
              left: 0.05 * screenWidth,
              child:  Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.3,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: Colors.black
                  ),
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(209, 209, 209, 1),
                ),
                child: TextFormField(
                  controller: content,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Dmsan_regular',
                    //Thêm textAlignVertical vào TextStyle
                  ),
                  decoration: InputDecoration(
                    hintText: 'Your Review',
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

            Positioned(
              bottom: 10,
              left: (screenWidth - screenWidth /3 * 2) / 2,
              child: Container(
                height: screenWidth/5,
                width: screenWidth /3 * 2,
                alignment: Alignment.center,
                child: ButtonType1(Height: screenWidth/6, Width: screenWidth /3 * 2, color: Colors.orange, radiusBorder: 25, title: "Add review", fontText: 'Dmsan_regular', colorText: Colors.white,
                    onTap: () async {
                         if (content.text.isNotEmpty) {
                           setState(() {
                             loading = true;
                           });
                           Evaluate eva = Evaluate(owner: currentAccount, content: content.text.toString(), star: number);
                           widget.product.evaluateList.add(eva);
                           await pushData();
                           setState(() {
                             loading = false;
                           });
                           toastMessage("add success");
                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainmenuMobi()),);
                         }
                    }, loading: loading,),
              ),
            )


          ],
        ),
      ),
    );
  }
}
