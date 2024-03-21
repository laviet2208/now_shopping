
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:ning_web/Finalclass/finalclass.dart';
import 'package:ning_web/main_screens/Before_entering/signin_screen.dart';
import 'package:ning_web/main_screens/MainmenuScreen/Lo%E1%BA%A1i%20s%E1%BA%A3n%20ph%E1%BA%A9m.dart';

import 'Xem theo loại sản phẩm/Màn hình xem loại sản phẩm.dart';

class Itemloaisanpham extends StatefulWidget {
  final DataType dataType;
  const Itemloaisanpham({Key? key, required this.dataType}) : super(key: key);

  @override
  State<Itemloaisanpham> createState() => _ItemloaisanphamState();
}

class _ItemloaisanphamState extends State<Itemloaisanpham> {
  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 50)/3;

    return GestureDetector(
      child: Container(
        width: width,
        height: width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15), // màu của shadow
              spreadRadius: 5, // bán kính của shadow
              blurRadius: 7, // độ mờ của shadow
              offset: Offset(0, 3), // vị trí của shadow
            ),
          ],
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              width: 1,
              color: Colors.grey.withOpacity(0.3)
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 5,
              left: 20,
              right: 20,
              child: Container(
                width: width - 40,
                height: width - 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(widget.dataType.imageUrl)
                    )
                ),
              ),
            ),

            Positioned(
              top: 8 + width - 40,
              left: 5,
              right: 5,
              child: LocaleText(
                widget.dataType.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'arial',
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black,
                    fontSize: width/9,
                    fontWeight: FontWeight.normal
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        if (currentAccount.id != '') {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ScreenViewProductByType(dataType: widget.dataType,),),);
        } else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => SigninScreen(),),);
        }
      },
    );
  }
}
