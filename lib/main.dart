import 'package:flutter/material.dart';
import 'package:flutter_tutorial/login/login.dart';
import 'package:flutter_tutorial/page/cultureHeritage/cultureHeritageList.dart';
import 'package:flutter_tutorial/page/promotionVideo/promotionVideoAdd.dart';
import 'package:flutter_tutorial/page/promotionVideo/promotionVideoUpdate.dart';
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
          '/': (context) => CultureHeritageList(), //기본 설정 값
        },
      ),
    );
  }
}
//
