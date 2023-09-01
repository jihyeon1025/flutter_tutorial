import 'package:flutter/material.dart';
import 'package:flutter_tutorial/login/login.dart';
import 'package:flutter_tutorial/page/festival/festivalUpdate.dart';
import 'package:flutter_tutorial/page/gallery/galleryList.dart';
import 'package:flutter_tutorial/page/gallery/galleryUpdate.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<String>.value(
      value: 'share data',
      child: MaterialApp(
        title: 'start flutter',
        initialRoute: '',
        routes: {
          '/': (context) => galleryUpdate(), //기본 설정 값
        },
      ),
    );
  }
}
//
