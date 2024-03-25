import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TopAds extends StatefulWidget {
  final List<String> adsList;
  const TopAds({Key? key, required this.adsList}) : super(key: key);

  @override
  State<TopAds> createState() => _TopAdsState();
}

class _TopAdsState extends State<TopAds> {
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 30;

    return widget.adsList.isNotEmpty ? Container(
      width: width,
      height: width/3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(widget.adsList[index])
        )
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: width/9,
            bottom: width/9,
            left: 5,
            child: GestureDetector(
              child: Container(
                width: (width/9),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1000),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1), // màu của shadow
                      spreadRadius: 5, // bán kính của shadow
                      blurRadius: 7, // độ mờ của shadow
                      offset: Offset(0, 3), // vị trí của shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.black,
                  ),
                ),
              ),
              onTap: () {
                if (index == 0) {
                  setState(() {
                    index = widget.adsList.length - 1;
                  });
                } else {
                  setState(() {
                    index = index - 1;
                  });
                }
              },
            ),
          ),

          Positioned(
            top: width/9,
            bottom: width/9,
            right: 5,
            child: GestureDetector(
              child: Container(
                width: (width/9),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(1000),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1), // màu của shadow
                      spreadRadius: 5, // bán kính của shadow
                      blurRadius: 7, // độ mờ của shadow
                      offset: Offset(0, 3), // vị trí của shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                ),
              ),
              onTap: () {
                if (index == widget.adsList.length - 1) {
                  setState(() {
                    index = 0;
                  });
                } else {
                  setState(() {
                    index = index + 1;
                  });
                }
              },
            ),
          ),
        ],
      ),
    ) : Container(width: width, height: width/3,alignment: Alignment.center,child: Container(width: 30, height: 30, alignment: Alignment.center,child: CircularProgressIndicator(color: Colors.deepOrangeAccent,),),);
  }
}


