import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:ning_web/utils/utils.dart';

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
