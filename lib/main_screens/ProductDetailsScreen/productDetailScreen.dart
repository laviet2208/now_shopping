import 'package:flutter/material.dart';
import 'package:ning_web/General/Product/Product.dart';
import 'package:ning_web/General/Tool/ChangeNumber.dart';
import 'package:ning_web/General/Tool/Compact.dart';
import 'package:ning_web/main_screens/Item/productItem/EvaluateItem.dart';
import 'package:ning_web/main_screens/Item/productItem/ProductImageItem.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ning_web/main_screens/ProductDetailsScreen/mobile.dart';
import 'package:ning_web/main_screens/ShopScreen/Screen.dart';
import '../../Button/Buttontype1.dart';

class proDuctDetailScreen extends StatefulWidget {
  const proDuctDetailScreen({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  State<proDuctDetailScreen> createState() => _proDuctDetailScreenState();
}

class _proDuctDetailScreenState extends State<proDuctDetailScreen> {
  String _currentImageUrl = "";
  @override
  void initState() {
    _currentImageUrl = widget.product.url[0];
  }

  void _onItemSelected(String imageUrl) {
    // update the state to show the new image
    setState(() {
      _currentImageUrl = imageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double baseWidth = 1920;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    String promotion = "Promotion : Not flash sale product";
    if (widget.product.isSale) {
      promotion = "Promotion : is a flash sale product";
    }

    if (screenWidth <= 850) {
      return mobiDetailProduct(product: widget.product);
    }


    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration (
              color: Color(0xfff5f5f5),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  offset: Offset(0*fem, 4*fem),
                  blurRadius: 2*fem,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(32*fem, 24*fem, 39*fem, 21*fem),
                  decoration: BoxDecoration(
                      color: Colors.white
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 33*fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin:  EdgeInsets.fromLTRB(0*fem, 50*fem, 33*fem, 19*fem),

                              child: Text(
                                'N-ing Shop',
                                style: TextStyle (
                                  fontFamily: 'Dmsan_regular',
                                  fontSize: 80*ffem,
                                  height: 0.225*ffem/fem,
                                  decoration: TextDecoration.none,
                                  color: Color(0xff3669c9),
                                ),
                              ),
                            ),

                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16*fem),
                                child: Material(
                                  borderRadius: BorderRadius.circular(37*fem),
                                  elevation: 1,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Search anything in Ning',
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 16*fem),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: screenWidth/1.28,
                  height: screenHeight/1.25,
                  decoration: BoxDecoration(
                  ),

                  child: ListView(
                    children: [

                      Container(
                        width: screenWidth,
                        height: screenHeight/50,
                      ),


                      //Phần hiển thị ảnh và các thông tin ngắn gọn
                      Container(
                        height: screenHeight/1.5,
                        decoration: BoxDecoration (
                          color: Colors.white,
                        ),
                        child: Stack(
                          children: <Widget>[

                            //Ảnh to đùng
                            Positioned(
                              top: screenWidth/192,
                              left: screenWidth/192,
                              child: Container(
                                width:  screenHeight/2,
                                height:  screenHeight/2 ,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  border: Border.all(
                                    color: Colors.orange,
                                    width: 2.0,
                                  ),
                                ),
                                child: Image.network(
                                  _currentImageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            //Ảnh nhỏ hơn
                            Positioned(
                              top: 2 * screenWidth / 192 + screenHeight / 2,
                              left: screenWidth / 192,
                              child: Container(
                                width: screenHeight / 2,
                                height: screenHeight / 1.5 - 2 * screenWidth / 192 - screenHeight / 2,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget.product.url.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.only(right: 15),
                                      child: GestureDetector(
                                        onTap: () {
                                          _onItemSelected(widget.product.url[index]);
                                        },
                                        child: ProductImageWidget(
                                          productURL: widget.product.url[index],
                                          width: screenHeight / 2,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),

                            //Tên sản phẩm
                            Positioned(
                                top: screenWidth/192,
                                left: screenWidth/192 + screenHeight/2 + screenWidth/64,
                                child: Text(compactString(40, widget.product.name), textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Dmsan_regular',
                                    fontSize: screenWidth / 45,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 0
                                ),
                                )
                            ),

                            //Đánh giá sản phẩm
                            Positioned(
                                top: screenWidth/30,
                                left: screenWidth/192 + screenHeight/2 + screenWidth/64,
                                child: Text(countRate(widget.product.evaluateList), textAlign: TextAlign.left, style: TextStyle(
                                    color: Colors.orange,
                                    fontFamily: 'Dmsan_regular',
                                    fontSize: screenWidth / 70,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 0
                                ),)
                            ),

                            //Hình ngôi sao bên cạnh
                            Positioned(
                                top: screenWidth/30 + 3,
                                left: screenWidth/192 + screenHeight/2 + screenWidth/64 + screenWidth/192*5,
                                child: Container(
                                  width: screenWidth/192*3,
                                  height: screenWidth/192*3,
                                  child: Image.asset(
                                    "assets/mainMenuIcon/imgstar.png",
                                    fit: BoxFit.cover,
                                  ),
                                )
                            ),

                            Positioned(
                                top: screenWidth/30 + 3,
                                left: screenWidth/192 + screenHeight/2 + screenWidth/64 + screenWidth/192*9,
                                child: Container(
                                  width: 2,
                                  height: screenWidth/192*3,
                                  decoration: BoxDecoration(
                                      color: Colors.black
                                  ),
                                )
                            ),

                            Positioned(
                              top: screenWidth/30,
                              left: screenWidth/192 + screenHeight/2 + screenWidth/64 + screenWidth/192*10,
                              child: Container(
                                width:  screenWidth/192*24,
                                height:  screenWidth/192*4 ,
                                alignment: Alignment.center,
                                child: Text(
                                  getStringNumber(widget.product.evaluateList.length.toDouble()) + " Reviews",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'Dmsan_regular',
                                    fontSize: screenWidth / 75,
                                  ),
                                ),
                              ),
                            ),

                            Positioned(
                                top: screenWidth/30 + 3,
                                left: screenWidth/192 + screenHeight/2 + screenWidth/64 + screenWidth/192*34,
                                child: Container(
                                  width: 2,
                                  height: screenWidth/192*3,
                                  decoration: BoxDecoration(
                                      color: Colors.black
                                  ),
                                )
                            ),

                            Positioned(
                              top: screenWidth/30,
                              left: screenWidth/192 + screenHeight/2 + screenWidth/64 + screenWidth/192*35,
                              child: Container(
                                width:  screenWidth/192*24,
                                height:  screenWidth/192*4 ,
                                alignment: Alignment.center,
                                child: Text(
                                  getStringNumber(widget.product.evaluateList.length.toDouble()) + " Rates",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'Dmsan_regular',
                                    fontSize: screenWidth / 75,
                                  ),
                                ),
                              ),
                            ),

                            Positioned(
                                top: screenWidth/30 + 3,
                                left: screenWidth/192 + screenHeight/2 + screenWidth/64 + screenWidth/192*59,
                                child: Container(
                                  width: 2,
                                  height: screenWidth/192*3,
                                  decoration: BoxDecoration(
                                      color: Colors.black
                                  ),
                                )
                            ),

                            //Phần giá tiền
                            Positioned(
                                top: screenWidth/15,
                                left: screenWidth/192 + screenHeight/2 + screenWidth/64,
                                child: Container(
                                  width:  screenHeight/2 * 1.8,
                                  height:  screenHeight/9,
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(246, 246, 246, 1)
                                  ),

                                  child: Text(
                                    "     \$. " + getStringNumber(widget.product.cost),
                                    style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontFamily: 'Dmsan_regular',
                                        fontSize: screenWidth / 70,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                )
                            ),

                            //Phần khuyến mại
                            Positioned(
                                top: screenWidth/9,
                                left: screenWidth/192 + screenHeight/2 + screenWidth/64,
                                child: Container(
                                  width:  screenHeight/2 * 1.8,
                                  height:  screenHeight/9,
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                  ),

                                  child: Text(
                                    promotion,
                                    style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontFamily: 'Dmsan_regular',
                                        fontSize: screenWidth / 70,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                )
                            ),


                            //Thêm vào giỏ hàng
                            Positioned(
                              top: screenWidth/6,
                              left: screenWidth/192 + screenHeight/2 + screenWidth/64,
                              child: ButtonType1(Height: screenHeight / 16, Width: screenWidth / 7.38, color: Color.fromRGBO(255, 184, 0, 1), radiusBorder: 10, title: "Add to cart", fontText: 'Dmsan_regular', colorText: Colors.black,
                                onTap: (){

                                },
                              ),
                            ),

                            //Thêm vào yêu thích
                            Positioned(
                              top: screenWidth/6,
                              left: 2 * screenWidth/192 + screenHeight/2 + screenWidth/64 + screenWidth / 7.38,
                              child: ButtonType1(Height: screenHeight / 16, Width: screenWidth / 7.38, color: Color.fromRGBO(249, 46, 76, 1), radiusBorder: 10, title: "Add to wishlist", fontText: 'Dmsan_regular', colorText: Colors.white,
                                onTap: (){

                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: screenWidth,
                        height: screenHeight/50,
                      ),

                      //Phần hiển thị thông tin shop
                      Container(
                        height: screenHeight/5,
                        decoration: BoxDecoration (
                          color: Colors.white,
                        ),

                        child: Stack(
                          children: <Widget>[
                            //Ảnh đại diện
                            Positioned(
                              top: screenHeight/25,
                              left: screenHeight/25,
                              child: Container(
                                width: 3 * screenHeight/25,
                                height: 3 * screenHeight/25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(screenHeight/6),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(widget.product.shop.url),
                                  ),
                                  border: Border.all(
                                    color: Colors.deepOrange,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),

                            //Tên shop
                            Positioned(
                                top: screenHeight/25,
                                left: screenHeight/25 + 3 * screenHeight/25 + screenWidth/48,
                                child: Text(widget.product.shop.name, textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Dmsan_regular',
                                    fontSize: screenWidth / 55,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 0
                                ),
                                )
                            ),

                            //follow shop
                            Positioned(
                              top: screenHeight/10,
                              left: screenHeight/25 + 3 * screenHeight/25 + screenWidth/48,
                              child: ButtonType1(Height: 3 * screenHeight/50, Width: 4 * screenHeight/25, color: Color.fromRGBO(255, 184, 0, 1), radiusBorder: 10, title: "Follow shop", fontText: 'Dmsan_regular', colorText: Colors.black,
                                onTap: (){

                                },
                              ),
                            ),

                            //view shop
                            Positioned(
                              top: screenHeight/10,
                              left: screenHeight/25 + 3 * screenHeight/25 + screenWidth/48 + 4 * screenHeight/25 + screenWidth/192*2,
                              child: ButtonType1(Height: 3 * screenHeight/50, Width: 4 * screenHeight/25, color: Color.fromRGBO(249, 46, 76, 1), radiusBorder: 10, title: "View shop", fontText: 'Dmsan_regular', colorText: Colors.white,
                                onTap: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => ShopScreen(shop: widget.product.shop)));
                                },
                              ),
                            ),

                          ],
                        ),
                      ),

                      Container(
                        width: screenWidth,
                        height: screenHeight/50,
                      ),

                      //Phần thông tin mô tả sản phẩm
                      Container(
                          height: screenHeight/14,
                          decoration: BoxDecoration (
                            color: Colors.white,
                          ),

                          child: Stack(
                              children: <Widget>[
                                Positioned(
                                    top: screenWidth/192,
                                    left: screenWidth/192,
                                    child: Text("Detailed Product Description", textAlign: TextAlign.left, style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Dmsan_regular',
                                        fontSize: screenWidth / 55,
                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 0
                                    ),
                                    )
                                ),

                              ]
                          )
                      ),

                      Container(
                        height: 2,
                        decoration: BoxDecoration (
                          color: Colors.orange,
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration (
                          color: Colors.white,
                        ),
                        child: AutoSizeText(
                          widget.product.content,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Dmsan_regular',
                              fontSize: screenWidth / 70,
                              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 0
                          ),
                          maxLines: 20, // giới hạn số dòng của text
                          overflow: TextOverflow.ellipsis, // xử lý khi text bị tràn
                        ),
                      ),


                      Container(
                        height: screenWidth/60,
                        decoration: BoxDecoration (
                          color: Colors.white,
                        ),
                      ),

                      Container(
                        width: screenWidth,
                        height: screenHeight/50,
                      ),

                      //Phần bình luận
                      Container(
                          width: screenWidth,
                          height: screenHeight/14,
                          decoration: BoxDecoration (
                            color: Colors.white,
                          ),
                          child: Stack(
                              children: <Widget>[
                                Positioned(
                                    top: screenWidth/192,
                                    left: screenWidth/192,
                                    child: Text("Product Rating", textAlign: TextAlign.left, style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 1),
                                        fontFamily: 'Dmsan_regular',
                                        fontSize: screenWidth / 55,
                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 0
                                    ),
                                    )
                                ),

                              ]
                          )
                      ),

                      Container(
                        height: 2,
                        decoration: BoxDecoration (
                          color: Colors.orange,
                        ),
                      ),

                      Container(
                        width: screenWidth/1.28,
                        height: screenHeight,
                        decoration: BoxDecoration (
                          color: Colors.white,
                        ),


                        child: Stack(
                          children: <Widget>[
                            Container(
                                decoration: BoxDecoration(
                                ),
                                child: GridView.builder(
                                  itemCount: widget.product.evaluateList.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1, // số phần tử trên mỗi hàng
                                    mainAxisSpacing: 10, // khoảng cách giữa các hàng
                                    childAspectRatio: 3/1, // tỷ lệ chiều rộng và chiều cao
                                  ),
                                  itemBuilder: (context, index) {
                                    return EvaluateItem(evaluate: widget.product.evaluateList[index], width: screenWidth/1.28, height: screenWidth/1.28);
                                  },
                                )
                            ),
                          ],
                        ),
                      ),

                      Container(
                        height: 10,
                        decoration: BoxDecoration (
                          color: Colors.white,
                        ),
                      ),

                      Container(
                          height: screenWidth/18,
                          decoration: BoxDecoration (
                            color: Colors.white,
                          ),
                          alignment: Alignment.center, // canh giữa theo chiều dọc và ngang
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                child: ButtonType1(Height: screenWidth/27, Width: 4 * screenWidth/27, color: Color.fromRGBO(249, 46, 76, 1), radiusBorder: 10, title: "View all comment", fontText: 'Dmsan_regular', colorText: Colors.white,
                                  onTap: (){

                                  },
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
