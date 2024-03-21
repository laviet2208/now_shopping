import 'package:flutter/material.dart';
import 'package:ning_web/Button/Buttontype1.dart';
import 'package:ning_web/Finalclass/finalclass.dart';
import 'package:ning_web/General/Product/Product.dart';
import 'package:ning_web/utils/utils.dart';

import '../../General/Product/Evaluate.dart';
import '../ProductDetailsScreen/mobileReview.dart';
import 'AddReview/MobileScreen.dart';

class EvaluateDetailMobi extends StatefulWidget {
  final List<Evaluate> evaluateList;
  final Product product;
  const EvaluateDetailMobi({Key? key, required this.evaluateList, required this.product}) : super(key: key);

  @override
  State<EvaluateDetailMobi> createState() => _EvaluateDetailMobiState();
}

class _EvaluateDetailMobiState extends State<EvaluateDetailMobi> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    int five = 0;
    int four = 0;
    int three = 0;
    int two = 0;
    int one = 0;
    int total = widget.evaluateList.length;

    double fivep = 0;
    double fourp = 0;
    double threep = 0;
    double twop = 0;
    double onep = 0;

    for (int i = 0 ; i < widget.evaluateList.length ; i++) {
      if (widget.evaluateList[i].star == 5) {
        five = five + 1;
      }
      if (widget.evaluateList[i].star == 4) {
        four = four + 1;
      }
      if (widget.evaluateList[i].star == 3) {
        three = three + 1;
      }
      if (widget.evaluateList[i].star == 2) {
        two = two + 1;
      }
      if (widget.evaluateList[i].star == 1) {
        one = one + 1;
      }
    }

    if (total != 0) {
      fivep = five/total;
      fourp = four/total;
      threep = three/total;
      twop = two/total;
      onep = one/total;
    }

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
                    "N-Ing Shop / All review",
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
              top: 0.05 * screenHeight,
              left: 0.02 * screenWidth,
              child: Container(
                width: screenWidth * 0.96,
                height: 0.91 * screenHeight,
                child: ListView(
                  children: [
                    Container(
                      height: 10,
                    ),

                    Container(
                      height: 28,
                      decoration: BoxDecoration(

                      ),

                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: 0.4 * screenWidth + 4,
                              height: 0.4 * screenWidth / 6.25,
                              child: Image.network(
                                "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2FStar%2Frating5.png?alt=media&token=9007957a-180f-4c5a-aeb3-d4b85be33a48",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Positioned(
                            top: 10,
                            left: 0.4 * screenWidth + 10,
                            child: Container(
                              height: 0.1 * screenWidth / 6.25,
                              width: 0.96 * screenWidth - 0.4 * screenWidth + 8,
                              child: LinearProgressIndicator(
                                value: fivep,
                                backgroundColor: Colors.grey[200],
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                              ),
                            )
                          )

                        ],
                      ),
                    ),

                    Container(
                      height: 10,
                    ),

                    Container(
                      height: 28,
                      decoration: BoxDecoration(

                      ),

                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: 0.4 * screenWidth + 4,
                              height: 0.4 * screenWidth / 6.25,
                              child: Image.network(
                                "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2FStar%2Frating1.png?alt=media&token=596d8ad3-58eb-437b-85c4-ef6a7ef73a77",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Positioned(
                              top: 10,
                              left: 0.4 * screenWidth + 10,
                              child: Container(
                                height: 0.1 * screenWidth / 6.25,
                                width: 0.96 * screenWidth - 0.4 * screenWidth + 8,
                                child: LinearProgressIndicator(
                                  value: fourp,
                                  backgroundColor: Colors.grey[200],
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                                ),
                              )
                          )

                        ],
                      ),
                    ),

                    Container(
                      height: 10,
                    ),

                    Container(
                      height: 28,
                      decoration: BoxDecoration(

                      ),

                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: 0.4 * screenWidth + 4,
                              height: 0.4 * screenWidth / 6.25,
                              child: Image.network(
                                "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2FStar%2Frating2.png?alt=media&token=f1706f9e-221d-4ea1-a9fd-914b27ee7d3f",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Positioned(
                              top: 10,
                              left: 0.4 * screenWidth + 10,
                              child: Container(
                                height: 0.1 * screenWidth / 6.25,
                                width: 0.96 * screenWidth - 0.4 * screenWidth + 8,
                                child: LinearProgressIndicator(
                                  value: threep,
                                  backgroundColor: Colors.grey[200],
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                                ),
                              )
                          )

                        ],
                      ),
                    ),

                    Container(
                      height: 10,
                    ),

                    Container(
                      height: 28,
                      decoration: BoxDecoration(

                      ),

                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: 0.4 * screenWidth + 4,
                              height: 0.4 * screenWidth / 6.25,
                              child: Image.network(
                                "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2FStar%2Frating3.png?alt=media&token=b0b000bd-3fb7-439c-ad75-d112f65c8d4c",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Positioned(
                              top: 10,
                              left: 0.4 * screenWidth + 10,
                              child: Container(
                                height: 0.1 * screenWidth / 6.25,
                                width: 0.96 * screenWidth - 0.4 * screenWidth + 8,
                                child: LinearProgressIndicator(
                                  value: twop,
                                  backgroundColor: Colors.grey[200],
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                                ),
                              )
                          )

                        ],
                      ),
                    ),

                    Container(
                      height: 10,
                    ),

                    Container(
                      height: 28,
                      decoration: BoxDecoration(

                      ),

                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: 0.4 * screenWidth + 4,
                              height: 0.4 * screenWidth / 6.25,
                              child: Image.network(
                                "https://firebasestorage.googleapis.com/v0/b/congtam-c7a46.appspot.com/o/icon%2FStar%2Frating4.png?alt=media&token=20e733e7-b387-44dc-b57a-f79b802628ff",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Positioned(
                              top: 10,
                              left: 0.4 * screenWidth + 10,
                              child: Container(
                                height: 0.1 * screenWidth / 6.25,
                                width: 0.96 * screenWidth - 0.4 * screenWidth + 8,
                                child: LinearProgressIndicator(
                                  value: onep,
                                  backgroundColor: Colors.grey[200],
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                                ),
                              )
                          )

                        ],
                      ),
                    ),

                    Container(height: 10,),
                    Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: Colors.black
                      ),
                    ),
                    Container(height: 10,),


                    Container(
                        height: screenHeight / 3 * 2,
                        decoration: BoxDecoration(
                          color: Color(0xfff1f1f1),
                        ),
                        child: GridView.builder(
                          itemCount: widget.evaluateList.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, // số phần tử trên mỗi hàng
                            mainAxisSpacing: 10, // khoảng cách giữa các hàng
                            childAspectRatio: 3/1, // tỷ lệ chiều rộng và chiều cao
                          ),
                          itemBuilder: (context, index) {
                            return MobileReviewItem(evaluate: widget.evaluateList[index], width: screenWidth/1.28, height: screenHeight/4);
                          },
                        )
                    ),


                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              left: (screenWidth - screenWidth /3 * 2) / 2,
              child: Container(
                height: screenWidth/5,
                width: screenWidth /3 * 2,
                alignment: Alignment.center,
                child: ButtonType1(Height: screenWidth/5, Width: screenWidth /3 * 2, color: Colors.orange, radiusBorder: 25, title: "Add review", fontText: 'Dmsan_regular', colorText: Colors.white,
                    onTap: () {
                        bool check = true;
                        for (int i = 0 ; i < widget.evaluateList.length ; i++) {
                          if (widget.evaluateList[i].owner.id == currentAccount.id) {
                            check = false;
                            break;
                          }
                        }
                        if (check) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddreviewMobi(product: widget.product,)),);
                        } else {
                          toastMessage("Your review was added");
                        }
                    }),
              ),
            )

          ],
        ),
      ),
    );
  }
}
