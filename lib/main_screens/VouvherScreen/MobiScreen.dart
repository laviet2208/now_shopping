import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ning_web/Button/Buttontype1.dart';
import 'package:ning_web/utils/utils.dart';

import '../../Finalclass/finalclass.dart';
import '../../General/Account/Account.dart';
import '../../General/Product/Voucher.dart';
import 'MobiItemtype1.dart';

class VoucherScreenMobi extends StatefulWidget {
  const VoucherScreenMobi({Key? key}) : super(key: key);

  @override
  State<VoucherScreenMobi> createState() => _VoucherScreenMobiState();
}

class _VoucherScreenMobiState extends State<VoucherScreenMobi> {
  List<voucher> voucherNG = [];
  List<voucher> voucherNN = [];
  String idRece = "";
  bool loading = false;
  bool loading1 = false;


  Future<void> getNNData(String email) async{
    final reference = FirebaseDatabase.instance.reference();
    DatabaseEvent dataSnapshot = await reference.child("Account").once();
    final dynamic account = dataSnapshot.snapshot.value;
    account.forEach((key, value) {
      if (value["username"].toString() == email) {
        Account myacc = Account.fromJson(value);
        idRece = myacc.id;
        voucherNN = myacc.voucherList;
      }
    });
  }

  Future<void> pushData(String email, List<voucher> voucherList) async {
    final reference = FirebaseDatabase.instance.reference();
    // Cập nhật voucherList
    await reference.child("Account/" + idRece + "/voucherList").remove();
    for (int i = 0 ; i < voucherList.length ; i++) {
      await reference.child("Account/" + idRece + "/voucherList/" + i.toString()).set(voucherList[i].toJson());
    }

    // await reference.child("Account/" + idRece + "/voucherList").push().set(voucherList.map((voucher) => voucher.toJson()).toList());
  }

  Future<void> pushData1(List<voucher> voucherList) async {
    final reference = FirebaseDatabase.instance.reference();
    // Cập nhật voucherList
    await reference.child("Account/" + currentAccount.id + "/voucherList").remove();
    for (int i = 0 ; i < voucherList.length ; i++) {
      await reference.child("Account/" + currentAccount.id + "/voucherList/" + i.toString()).set(voucherList[i].toJson());
    }
    setState(() {

    });
  }


  Future<bool> checkEmailExists(String email) async {
    final reference = FirebaseDatabase.instance.reference();
    final dataSnapshot = await reference.child("Account").orderByChild("username").equalTo(email).once();
    return dataSnapshot.snapshot.value != null;
  }


  final emailController = TextEditingController();
  final emailKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double baseWidth = 1920;

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
              'MY VOUCHER',
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
                height: screenHeight*0.9 - screenWidth/2,
                child: ListView(
                  children: [
                    Container(
                      height: 5,
                    ),

                    Container(
                        height: screenHeight/1.8 ,
                        child: GridView.builder(
                          itemCount: currentAccount.voucherList.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, // số phần tử trên mỗi hàng
                            mainAxisSpacing: 10, // khoảng cách giữa các hàng
                            crossAxisSpacing: 0, // khoảng cách giữa các cột
                            childAspectRatio: 2/1, // tỷ lệ chiều rộng và chiều cao
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                              child: InkWell(
                                child: VoucherItemMobile(thisvoucher: currentAccount.voucherList[index], width: screenWidth * 0.98, height: screenWidth * 0.49),
                              ),
                            );
                          },
                        )
                    ),

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
                        "Gift your voucher",
                        style: TextStyle(
                          fontSize: screenHeight*0.025,
                          fontFamily: 'Dmsan_regular',
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),

                    //EditText email
                    Positioned(
                      top: screenHeight/20,
                      left: 10,
                      child: Container(
                        width: screenWidth * 0.87,
                        height: screenHeight * 0.07,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Colors.black
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                        child: Form(
                          key: emailKey,
                          child: TextFormField(
                            controller: emailController,
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
                              prefixIcon: Icon(Icons.email),
                              hintText: 'yourreceiverAccount@gmail.com',
                              hintStyle: TextStyle(
                                color: Colors.black,
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

                    //Gift voucher button
                    Positioned(
                      top: screenHeight/20 + screenHeight * 0.1,
                      left: 10,
                      child: ButtonType1(Height: screenHeight * 0.07, Width: screenWidth * 0.3, color: Colors.deepOrange, radiusBorder: 10, title: "Gift select", fontText: 'Dmsan_regular', colorText: Colors.white,
                        onTap: () async {
                            setState(() {
                              loading = true;
                            });

                            if (emailController.text.toString().isNotEmpty) {
                              if (await checkEmailExists(emailController.text.toString())) {
                                await getNNData(emailController.text.toString());
                                for (int i = 0 ; i < voucherSelect.length ; i++) {
                                  currentAccount.voucherList.remove(voucherSelect[i]);
                                  voucherNN.add(voucherSelect[i]);
                                }

                                await pushData1(currentAccount.voucherList);
                                await pushData(emailController.text.toString(), voucherNN);
                                setState(() {
                                  loading = false;
                                });
                                voucherSelect.clear();
                                toastMessage("Success in gift");
                              } else {
                                toastMessage("This email does not exist on the system");
                                setState(() {
                                  loading = false;
                                });
                              }
                            } else {
                              setState(() {
                                loading = false;
                              });
                              toastMessage("You must fill the Email text");
                            }

                        }, loading: loading,),
                    ),

                    //Gift all voucher button
                    Positioned(
                      top: screenHeight/20 + screenHeight * 0.1,
                      left: 10 + screenWidth * 0.32,
                      child: ButtonType1(Height: screenHeight * 0.07, Width: screenWidth * 0.3, color: Colors.redAccent, radiusBorder: 10, title: "Gift all", fontText: 'Dmsan_regular', colorText: Colors.white,
                          onTap: () async {
                            setState(() {
                              loading1 = true;
                            });


                            if (emailController.text.toString().isNotEmpty) {
                              if (await checkEmailExists(emailController.text.toString())) {
                                 await getNNData(emailController.text.toString());
                                 voucherNN.clear();
                                 for (int i = 0 ; i < currentAccount.voucherList.length ; i++) {
                                   voucherNN.add(currentAccount.voucherList[i]);
                                 }
                                    currentAccount.voucherList.clear();
                                    print("currentAccount.voucherList -- " + currentAccount.voucherList.length.toString());
                                    print("currentAccount.voucherList " + voucherNN.length.toString());

                                 await pushData1(currentAccount.voucherList);
                                    await pushData(emailController.text.toString(), voucherNN);
                                    setState(() {
                                     loading1 = false;
                                    });
                                 toastMessage("Success in gift all");
                                   } else {
                                     toastMessage("This email does not exist on the system");
                                     setState(() {
                                       loading1 = false;
                                     });
                                   }
                              } else {
                                 setState(() {
                                 loading1 = false;
                              });
                              toastMessage("You must fill the Email text");
                              }
                          }, loading: loading1),
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
