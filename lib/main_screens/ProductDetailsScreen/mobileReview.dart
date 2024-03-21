import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ning_web/General/Product/Evaluate.dart';
import 'package:ning_web/General/Tool/ChangeNumber.dart';

class MobileReviewItem extends StatelessWidget {
  final Evaluate evaluate;
  final double width;
  final double height;

  const MobileReviewItem({super.key, required this.evaluate, required this.width, required this.height});


  @override
  Widget build(BuildContext context) {
    String avaID = "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/account_no_img.png?alt=media&token=293d83fd-df2d-4182-a4fc-59b4ae4396de";
    String starturl = "";
    if (evaluate.owner.avatarId != null) {
      avaID = evaluate.owner.avatarId;
    }

    if (evaluate.star == 5) {
      starturl = "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2FStar%2Frating5.png?alt=media&token=9007957a-180f-4c5a-aeb3-d4b85be33a48";
    }

    if (evaluate.star == 4) {
      starturl = "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2FStar%2Frating1.png?alt=media&token=596d8ad3-58eb-437b-85c4-ef6a7ef73a77";
    }

    if (evaluate.star == 3) {
      starturl = "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2FStar%2Frating2.png?alt=media&token=f1706f9e-221d-4ea1-a9fd-914b27ee7d3f";
    }

    if (evaluate.star == 2) {
      starturl = "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2FStar%2Frating3.png?alt=media&token=b0b000bd-3fb7-439c-ad75-d112f65c8d4c";
    }

    if (evaluate.star == 1) {
      starturl = "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2FStar%2Frating4.png?alt=media&token=20e733e7-b387-44dc-b57a-f79b802628ff";
    }


    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.2), // màu của shadow
        //     spreadRadius: 5, // bán kính của shadow
        //     blurRadius: 7, // độ mờ của shadow
        //     offset: Offset(0, 3), // vị trí của shadow
        //   ),
        // ],
      ),

      child: Stack(
        children: <Widget>[
          //Ảnh đại diện
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width:  40,
              height:  40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40/2),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(avaID),
                ),
              ),
            ),
          ),


          //Tên tài khoản
          Positioned(
            top: 0,
            left: 55,
            child: Container(
              width:  width - 3*height/96 + width/15,
              height:  30 ,
              child:  Text(
                evaluate.owner.name,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'arial',
                    fontSize: 14,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.bold,
                    height: 0
                ),
              ),
            ),
          ),

          Positioned(
            top: 20,
            left: 55,
            child: Container(
              width: 90,
              height: 14,
              child: Image.network(
                starturl,
                fit: BoxFit.cover,
              ),
            )
          ),

          //Nội dung
          Positioned(
            top: 40,
            left: 55,
            child: Container(
              width:  width - 60,
              height:  80,
              decoration: BoxDecoration(
              ),

              child: AutoSizeText(
                evaluate.content,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'arial',
                    fontSize: 12,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
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