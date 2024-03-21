import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../../../Finalclass/finalclass.dart';
import '../../../General/Product/Product.dart';
import '../../../General/Shop/Shop.dart';
import '../../Item/mobile/productItem.dart';
import '../PC_ITEM/ITEM_productdetailPC.dart';
import 'DetailPage.dart';

class Viewallpage extends StatefulWidget {
  final double width;
  final double height;
  final List<Product> productList;
  const Viewallpage({Key? key, required this.width, required this.height, required this.productList}) : super(key: key);

  @override
  State<Viewallpage> createState() => _MainpageState();
}

class _MainpageState extends State<Viewallpage> {
  Product product = Product(id: 'id', name: 'name', content: 'content', type: [], cost: 1, url: [], imageList: [], evaluateList: [], isSale: true,
      shop: Shop(owner: currentAccount, id: '', url: '', name: '', followList: []));
  int selectindex = 0;

  Widget getBodyWidget() {
    // Dựa vào selectedIndex, trả về phần body tương ứng
    switch (selectindex) {
      case 0:
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
              color: Colors.white
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                      height: widget.height-30,
                      child: GridView.builder(
                        itemCount: widget.productList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, // số phần tử trên mỗi hàng
                          mainAxisSpacing: 0, // khoảng cách giữa các hàng
                          crossAxisSpacing: 0, // khoảng cách giữa các cột
                          childAspectRatio: ((widget.width/4) - 60)/250, // tỷ lệ chiều rộng và chiều cao
                        ),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                            child: InkWell(
                              onTap: () {
                                product = widget.productList[index];
                                Future.delayed(const Duration(milliseconds: 200), () {
                                  setState(() {
                                    selectindex = 3;
                                  });
                                });
                              },
                              child: ProductItemPCWidget(product: widget.productList[index], width: widget.width,),
                            ),
                          );
                        },
                      )
                  ),
                ),
              )
            ],
          ),
        );
      case 3:
        return detailPage(product: product, width: widget.width, height: widget.height);
      default:
        return Container();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBodyWidget(),
    );
  }
}
