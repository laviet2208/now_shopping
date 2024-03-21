import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ning_web/General/Product/Evaluate.dart';
import 'package:ning_web/General/Tool/ChangeNumber.dart';

class EvaluatemobiItem extends StatelessWidget {
  final Evaluate evaluate;
  final double width;
  final double height;

  const EvaluatemobiItem({super.key, required this.evaluate, required this.width, required this.height});



  @override
  Widget build(BuildContext context) {
    String avaID = "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/account_no_img.png?alt=media&token=293d83fd-df2d-4182-a4fc-59b4ae4396de";
    if (evaluate.owner.avatarId != null) {
      avaID = evaluate.owner.avatarId;
    }

    return Container(
      width: width,
      height: width/5,
      decoration: BoxDecoration(
        color : Colors.white,
      ),

      child: Stack(
        children: <Widget>[
          //Ảnh đại diện
          Positioned(
            top: height/96,
            left: height/96,
            child: Container(
              width:  width/10,
              height:  width/10 ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width/20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(avaID),
                ),
                border: Border.all(
                  color: Colors.deepOrange,
                  width: 1.0,
                ),
              ),
            ),
          ),


          //Tên tài khoản
          Positioned(
            top: height/96,
            left: width/10 + height/96 + 4,
            child: Container(
              width:  width - 3*height/96 + width/15,
              height:  width/30 ,
              child:  Text(
                evaluate.owner.name + "  |   " + getStringNumber(evaluate.star.toDouble()) + " Star",
                style: TextStyle(
                    color: Colors.deepOrange,
                    fontFamily: 'Dmsan_regular',
                    fontSize: width / 30,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.bold,
                    height: 0
                ),
              ),
            ),
          ),

          //Nội dung
          Positioned(
            top: width/15,
            left: width/10 + height/96 + 4,
            child: Container(
              width:  width - (width/10 + height/96 + 4),
              height:  width/5 - height/96 * 5  ,
              decoration: BoxDecoration(
                color: Color(0xfff5f5f5),
              ),

              child: AutoSizeText(
                evaluate.content,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Dmsan_regular',
                    fontSize: width / 65,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.bold,
                    height: 0
                ),
                maxLines: 6, // giới hạn số dòng của text
                overflow: TextOverflow.ellipsis, // xử lý khi text bị tràn
              ),
            ),
          ),
        ],
      ),
    );
  }
}