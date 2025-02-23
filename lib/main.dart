import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:ning_web/main_screens/Before_entering/first_loading_screen.dart';
import 'main_screens/MainmenuScreen/Data loại sản phẩm.dart';
import 'package:firebase_admin/firebase_admin.dart';



Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    // options: FirebaseOptions(
    //     apiKey: "AIzaSyBDpKP5mc3jjJRCM4xtPSlS3I5k3hn-qeE",
    //     authDomain: "nowshopping-493ca.firebaseapp.com",
    //     databaseURL: "https://nowshopping-493ca-default-rtdb.firebaseio.com",
    //     projectId: "nowshopping-493ca",
    //     storageBucket: "nowshopping-493ca.appspot.com",
    //     messagingSenderId: "291177236667",
    //     appId: "1:291177236667:web:e4b4e46dede6dba3f6419e",
    //     measurementId: "G-4T6LP0BZYH"
    // )
  );

  DataListType.addType();
  await Locales.init(['en','vi','tw','ko','ja']);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
    builder: (locale) => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FirstLoad(),
      // home: MenuManager(),
      localizationsDelegates: Locales.delegates,
      supportedLocales: Locales.supportedLocales,
      locale: locale,
    ),
    );
  }
}
