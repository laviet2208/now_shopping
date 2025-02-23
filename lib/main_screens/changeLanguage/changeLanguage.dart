import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:ning_web/utils/utils.dart';

import '../MainmenuScreen/mainmenu.dart';

class changeLanguage extends StatefulWidget {
  const changeLanguage({Key? key}) : super(key: key);

  @override
  State<changeLanguage> createState() => _changeLanguageState();
}

class _changeLanguageState extends State<changeLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(height: 60,),

          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => MainMenuScreen()));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                    size: 30,
                  ),

                  SizedBox(width: 10,),

                  Text(
                    'Back to setting',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(height: 60,),

          ListTile(
            title: Text("English"),
            onTap: () {
              LocaleNotifier.of(context)?.change('en');
              toastMessage('The language was changed to english');
            },
          ),

          ListTile(
            title: Text("Vietnamese"),
            onTap: () {
              LocaleNotifier.of(context)?.change('vi');
              toastMessage('Ngôn ngữ : Tiếng Việt');
            },
          ),

          ListTile(
            title: Text("Chinese"),
            onTap: () {
              LocaleNotifier.of(context)?.change('tw');
              toastMessage('语言: 中文');
            },
          ),

          ListTile(
            title: Text("Korean"),
            onTap: () {
              LocaleNotifier.of(context)?.change('ko');
              toastMessage('언어: 중국어');
            },
          ),

          ListTile(
            title: Text("Japanese"),
            onTap: () {
              LocaleNotifier.of(context)?.change('ja');
              toastMessage('言語: 中国語');
            },
          ),

        ],
      ),
    );
  }
}
