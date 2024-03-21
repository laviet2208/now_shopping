import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../../../Finalclass/finalclass.dart';
import '../../../General/Tool/ChangeNumber.dart';

class accountdetailPage extends StatefulWidget {
  final double width;
  final double height;
  const accountdetailPage({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  State<accountdetailPage> createState() => _accountdetailPageState();
}

class _accountdetailPageState extends State<accountdetailPage> {
  String url = "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/account_no_img.png?alt=media&token=293d83fd-df2d-4182-a4fc-59b4ae4396de";
  @override
  Widget build(BuildContext context) {

    if (currentAccount.avatarId.isNotEmpty) {
      url = currentAccount.avatarId;
    }
    return Scaffold(
      body:  Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
              color: Colors.white
          ),
          child: ListView(
            children: [
              Container(height: 20,),

              Padding(
                padding: EdgeInsets.only(left: (widget.width - widget.width/6)/2 , right: (widget.width - widget.width/6)/2),
                child: Container(
                  height: widget.width/6,
                  width: widget.width/6,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2), // màu của shadow
                        spreadRadius: 5, // bán kính của shadow
                        blurRadius: 7, // độ mờ của shadow
                        offset: Offset(0, 3), // vị trí của shadow
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(url),
                    ),
                    borderRadius: BorderRadius.circular(widget.width/6),
                  ),
                ),
              ),

              Container(height: 40,),

              Padding(
                padding: EdgeInsets.only(left: 10),
                child: LocaleText('yourname', textAlign: TextAlign.left, style: TextStyle(
                    color: Colors.pinkAccent,
                    fontFamily: 'arial',
                    fontSize: 18,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
              ),

              Container(height: 4,),

              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2), // màu của shadow
                          spreadRadius: 5, // bán kính của shadow
                          blurRadius: 7, // độ mờ của shadow
                          offset: Offset(0, 3), // vị trí của shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(
                          width: 1,
                          color: Colors.pinkAccent
                      )
                  ),

                  child: Text(
                    "  " + currentAccount.name,
                    style: TextStyle(
                        fontFamily: 'Dmsan_regular',
                        color: Colors.deepOrange,
                        fontSize: widget.width/60,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),

              Container(height: 20,),

              Padding(
                padding: EdgeInsets.only(left: 10),
                child: LocaleText('username', textAlign: TextAlign.left, style: TextStyle(
                    color: Colors.pinkAccent,
                    fontFamily: 'arial',
                    fontSize: 18,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
              ),

              Container(height: 4,),

              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2), // màu của shadow
                          spreadRadius: 5, // bán kính của shadow
                          blurRadius: 7, // độ mờ của shadow
                          offset: Offset(0, 3), // vị trí của shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(
                          width: 1,
                          color: Colors.pinkAccent
                      )
                  ),

                  child: Text(
                    "  " + currentAccount.username,
                    style: TextStyle(
                        fontFamily: 'Dmsan_regular',
                        color: Colors.deepOrange,
                        fontSize: widget.width/60,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),

              Container(height: 20,),

              Padding(
                padding: EdgeInsets.only(left: 10),
                child: LocaleText('password', textAlign: TextAlign.left, style: TextStyle(
                    color: Colors.pinkAccent,
                    fontFamily: 'arial',
                    fontSize: 18,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
              ),

              Container(height: 4,),

              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(
                          width: 1,
                          color: Colors.pinkAccent
                      )
                  ),

                  child: Text(
                    "  " + "*********",
                    style: TextStyle(
                        fontFamily: 'Dmsan_regular',
                        color: Colors.deepOrange,
                        fontSize: widget.width/60,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),

              Container(height: 20,),

              Padding(
                padding: EdgeInsets.only(left: 10),
                child: LocaleText('accid', textAlign: TextAlign.left, style: TextStyle(
                    color: Colors.pinkAccent,
                    fontFamily: 'arial',
                    fontSize: 18,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
              ),

              Container(height: 4,),

              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(
                          width: 1,
                          color: Colors.pinkAccent
                      )
                  ),

                  child: Text(
                    "  " + currentAccount.id,
                    style: TextStyle(
                        fontFamily: 'Dmsan_regular',
                        color: Colors.deepOrange,
                        fontSize: widget.width/60,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),

              Container(height: 20,),

              Padding(
                padding: EdgeInsets.only(left: 10),
                child: LocaleText('balance', textAlign: TextAlign.left, style: TextStyle(
                    color: Colors.pinkAccent,
                    fontFamily: 'arial',
                    fontSize: 18,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
              ),

              Container(height: 4,),

              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2), // màu của shadow
                          spreadRadius: 5, // bán kính của shadow
                          blurRadius: 7, // độ mờ của shadow
                          offset: Offset(0, 3), // vị trí của shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(
                          width: 1,
                          color: Colors.pinkAccent
                      )
                  ),

                  child: Text(
                    "  \$. " + getStringNumber(currentAccount.totalMoney),
                    style: TextStyle(
                        fontFamily: 'Dmsan_regular',
                        color: Colors.deepOrange,
                        fontSize: widget.width/60,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}
