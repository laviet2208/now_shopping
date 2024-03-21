import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:ning_web/General/Tool/ChangeNumber.dart';

import '../../Finalclass/finalclass.dart';
class viewAccMobi extends StatefulWidget {
  const viewAccMobi({Key? key}) : super(key: key);

  @override
  State<viewAccMobi> createState() => _viewAccMobiState();
}

class _viewAccMobiState extends State<viewAccMobi> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String url = "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/account_no_img.png?alt=media&token=293d83fd-df2d-4182-a4fc-59b4ae4396de";
    if (currentAccount.avatarId.isNotEmpty) {
      url = currentAccount.avatarId;
    }

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
              'PROFILE',
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
        child: ListView(
          children: [
            Container(height: 20,),

            Padding(
              padding: EdgeInsets.only(left: (screenWidth - screenWidth/3)/2 , right: (screenWidth - screenWidth/3)/2),
              child: Container(
                height: screenWidth/3,
                width: screenWidth/3,
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
                  borderRadius: BorderRadius.circular(screenWidth/6),
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
                      fontSize: screenWidth/22,
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
                      fontSize: screenWidth/22,
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
                      fontSize: screenWidth/22,
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
                      fontSize: screenWidth/22,
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
                      fontSize: screenWidth/22,
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
