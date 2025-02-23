import 'package:flutter/material.dart';
import 'package:ning_web/main_screens/Before_entering/signin_screen.dart';
import 'package:ning_web/main_screens/Before_entering/signup_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState()
  {
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
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
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.08,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 1, 7, 104),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => SignUpScreen()));
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontFamily: 'Dmsan_regular',
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.08,
                margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.02),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      color: Color.fromARGB(255, 1, 7, 104),
                      width: 2,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SigninScreen()),
                    );
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontFamily: 'Dmsan_regular',
                      color: Color.fromARGB(255, 1, 7, 104),
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
