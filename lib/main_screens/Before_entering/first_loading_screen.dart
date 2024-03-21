import 'package:flutter/material.dart';

import 'Controller/first_loading_controller.dart';

class FirstLoad extends StatefulWidget {
  const FirstLoad({Key? key}) : super(key: key);

  @override
  State<FirstLoad> createState() => _FirstLoadState();
}

class _FirstLoadState extends State<FirstLoad> {
  FirstLoading firstLoading = FirstLoading();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    firstLoading.isLogin(context, MediaQuery.of(context).size.width);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print(screenWidth.toString() + "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-" + screenHeight.toString());

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        child: Center(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.5,
                child: Image(
                  image: AssetImage('assets/logo_1.png'),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              Container(
                width: MediaQuery.of(context).size.height * 0.05,
                height: MediaQuery.of(context).size.height * 0.05,
                child: CircularProgressIndicator(
                  value: null,
                  color: Color(0xfff54b7e),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
