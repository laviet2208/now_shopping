import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:ning_web/Finalclass/finalclass.dart';
import 'package:ning_web/General/Tool/ChangeNumber.dart';
import 'package:ning_web/main_screens/Wallet/Mobiscreen/withdrawMoney.dart';
import 'package:url_launcher/url_launcher.dart';

class walletMobiScreen extends StatefulWidget {
  const walletMobiScreen({Key? key}) : super(key: key);

  @override
  State<walletMobiScreen> createState() => _walletMobiScreenState();
}

class _walletMobiScreenState extends State<walletMobiScreen> {
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
              'WALLET',
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
              top: 0.05 * screenHeight,
              left: 0.02 * screenWidth,
              child: Container(
                  width: 0.96 * screenWidth,
                  height: screenWidth/3 * 1.5,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(20),
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
                        top: 10,
                        left: 10,
                        child: LocaleText(
                          "totalmonei",
                          style: TextStyle(
                              fontFamily: 'Dmsan_regular',
                              color: Colors.white,
                              fontSize: screenWidth/15,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),

                      Positioned(
                        top: 50,
                        left: 10,
                        child: Text(
                          currentAccount.username,
                          style: TextStyle(
                              fontFamily: 'Dmsan_regular',
                              color: Colors.white,
                              fontSize: screenWidth/25,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal
                          ),
                        ),
                      ),

                      Positioned(
                        top: 80,
                        left: 10,
                        child: Text(
                          "\$. " + getStringNumber(currentAccount.totalMoney),
                          style: TextStyle(
                              fontFamily: 'Dmsan_regular',
                              color: Colors.white,
                              fontSize: screenWidth/15,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal
                          ),
                        ),
                      ),
                    ],
                  )
              ),
            ),

            Positioned(
              top: screenWidth/3 * 2,
              left: 0.02 * screenWidth + screenWidth/3 * 1.2 + 10,
              child: InkWell(
                onTap: () async {
                  launch("https://t.me/Ningshop_help");
                },
                child: Container(
                  height: screenWidth/3 * 0.4,
                  width: screenWidth/3 * 1.2,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.orange,
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
                  child: LocaleText(
                    "recharge",
                    style: TextStyle(
                        fontFamily: 'Dmsan_regular',
                        color: Colors.white,
                        fontSize: screenWidth/28,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: screenWidth/3 * 2,
              left: 0.02 * screenWidth,
              child: InkWell(
                onTap: () async {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => withdrawMobile()));
                },
                child: Container(
                  height: screenWidth/3 * 0.4,
                  width: screenWidth/3 * 1.2,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
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
                  child: LocaleText(
                    "withdraw",
                    style: TextStyle(
                        fontFamily: 'Dmsan_regular',
                        color: Colors.white,
                        fontSize: screenWidth/28,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: screenWidth/3 * 3,
              left: 10,
              child: Container(
                width: screenWidth-30,
                child: LocaleText(
                  "notice1",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                    fontFamily: 'arial'
                  ),
                ),
              ),
            ),

            Positioned(
              top: screenWidth/3 * 3.2,
              left: 10,
              child: Container(
                width: screenWidth-30,
                child: LocaleText(
                  "notice2",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                      fontFamily: 'arial'
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
