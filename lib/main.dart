import 'package:flutter/material.dart';
import 'package:flutter_app_three/pages/chooseLocation.dart';
import 'package:flutter_app_three/pages/flutterShizhan.dart';
import 'package:flutter_app_three/pages/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: 'MainPage',
      routes: {
        "loading": (context) => Loading(),
        "home": (context) => MyHomePage(
              title: 'fuck',
            ),
        "location": (context) => ChooseLocation(),
        "TextAndButton": (context) => TextAndButton(),
        "new_page": (context) => Loading(),
        "MainPage": (context) => MainPage(),
        "ImageTest": (context) => ImageTest(),
      },
    ));
