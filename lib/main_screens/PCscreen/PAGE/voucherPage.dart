import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../Button/Buttontype1.dart';
import '../../../Finalclass/finalclass.dart';
import '../../../General/Account/Account.dart';
import '../../../General/Product/Voucher.dart';
import '../../../utils/utils.dart';
import '../../VouvherScreen/MobiItemtype1.dart';

class voucherPage extends StatefulWidget {
  final double width;
  final double height;
  const voucherPage({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  State<voucherPage> createState() => _voucherPageState();
}

class _voucherPageState extends State<voucherPage> {
  List<voucher> voucherNG = [];
  List<voucher> voucherNN = [];
  String idRece = "";
  bool loading = false;
  bool loading1 = false;

  Future<void> getNNData(String email) async{
    final reference = FirebaseDatabase.instance.ref();
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
    final reference = FirebaseDatabase.instance.ref();
    // Cập nhật voucherList
    await reference.child("Account/" + idRece + "/voucherList").remove();
    for (int i = 0 ; i < voucherList.length ; i++) {
      await reference.child("Account/" + idRece + "/voucherList/" + i.toString()).set(voucherList[i].toJson());
    }

    // await reference.child("Account/" + idRece + "/voucherList").push().set(voucherList.map((voucher) => voucher.toJson()).toList());
  }

  Future<void> pushData1(List<voucher> voucherList) async {
    final reference = FirebaseDatabase.instance.ref();
    // Cập nhật voucherList
    await reference.child("Account/" + currentAccount.id + "/voucherList").remove();
    for (int i = 0 ; i < voucherList.length ; i++) {
      await reference.child("Account/" + currentAccount.id + "/voucherList/" + i.toString()).set(voucherList[i].toJson());
    }
    setState(() {

    });
  }


  Future<bool> checkEmailExists(String email) async {
    final reference = FirebaseDatabase.instance.ref();
    final dataSnapshot = await reference.child("Account").orderByChild("username").equalTo(email).once();
    return dataSnapshot.snapshot.value != null;
  }


  final emailController = TextEditingController();
  final emailKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: widget.width,
        height: widget.height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: widget.width/3,
              child: Container(
                height: widget.height,
                width: widget.width/3,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0.02 * (widget.height),
                        left: 0.01 * (widget.width/3),
                        child: Container(
                          width: (widget.width/3) * 0.98,
                          height: (widget.height)*0.9 - (widget.width/3)/2,
                          child: ListView(
                            children: [
                              Container(
                                height: 5,
                              ),

                              Container(
                                  height: (widget.height)/1.4 ,
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
                                          child: VoucherItemMobile(thisvoucher: currentAccount.voucherList[index], width: (widget.width/3) * 0.98, height: (widget.width/3) * 0.49),
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
                          height: (widget.width/3)/1.8,
                          width: (widget.height)*0.98,
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
                                    fontSize: (widget.height)*0.025,
                                    fontFamily: 'Dmsan_regular',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ),

                              //EditText email
                              Positioned(
                                top: (widget.height)/20,
                                left: 10,
                                child: Container(
                                  width: (widget.width/3) * 0.87,
                                  height: (widget.height) * 0.07,
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
                                top: (widget.height)/20 + (widget.height) * 0.1,
                                left: 10,
                                child: ButtonType1(Height: (widget.height) * 0.07, Width: (widget.width/3) * 0.3, color: Colors.deepOrange, radiusBorder: 10, title: "Gift select", fontText: 'Dmsan_regular', colorText: Colors.white,
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
                                top: (widget.height)/20 + (widget.height) * 0.1,
                                left: 10 + (widget.width/3) * 0.32,
                                child: ButtonType1(Height: (widget.height) * 0.07, Width: (widget.width/3) * 0.3, color: Colors.redAccent, radiusBorder: 10, title: "Gift all", fontText: 'Dmsan_regular', colorText: Colors.white,
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
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
