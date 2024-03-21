import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Finalclass/finalclass.dart';
import '../../../General/Tool/ChangeNumber.dart';
import '../../Wallet/Mobiscreen/withdrawMoney.dart';

class walletPagePC extends StatefulWidget {
  final double width;
  final double height;
  const walletPagePC({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  State<walletPagePC> createState() => _walletPagePCState();
}

class _walletPagePCState extends State<walletPagePC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: Stack(
          children: <Widget>[

            Positioned(
              top: 0.05 * widget.height,
              left: 0.02 * widget.width,
              child: Container(
                  width: 0.5 * widget.width,
                  height: widget.width/6,
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
                        top: 50,
                        left: 10,
                        child: LocaleText(
                          "totalmonei",
                          style: TextStyle(
                              fontFamily: 'arial',
                              color: Colors.white,
                              fontSize: widget.width/30,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal
                          ),
                        ),
                      ),

                      Positioned(
                        top: 10,
                        left: 10,
                        child: Text(
                          currentAccount.username,
                          style: TextStyle(
                              fontFamily: 'Dmsan_regular',
                              color: Colors.white,
                              fontSize: widget.width/50,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal
                          ),
                        ),
                      ),

                      Positioned(
                        top: 120,
                        left: 10,
                        child: Text(
                          "\$. " + getStringNumber(currentAccount.totalMoney),
                          style: TextStyle(
                              fontFamily: 'Dmsan_regular',
                              color: Colors.white,
                              fontSize: widget.width/25,
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
              top: 0.05 * widget.height +  widget.width/6 + 30,
              left: 0.02 * widget.width,
              child: InkWell(
                onTap: () async {
                  launch("https://t.me/Ningshop_help");
                },
                child: Container(
                  height: widget.width/3 * 0.15,
                  width: widget.width/3 * 0.6,
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
                        fontFamily: 'arial',
                        color: Colors.white,
                        fontSize: widget.width/56,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 0.05 * widget.height +  widget.width/6 + 30,
              left: 0.02 * widget.width + widget.width/3 * 0.6 + 40,
              child: InkWell(
                onTap: () async {
                  launch("https://t.me/Ningshop_help");
                },
                child: Container(
                  height: widget.width/3 * 0.15,
                  width: widget.width/3 * 0.6,
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
                        fontFamily: 'arial',
                        color: Colors.white,
                        fontSize: widget.width/56,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
