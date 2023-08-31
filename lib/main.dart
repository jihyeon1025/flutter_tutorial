import 'package:flutter/material.dart';
import 'package:flutter_tutorial/login/login.dart';
import 'package:flutter_tutorial/page/event/eventList.dart';
import 'package:flutter_tutorial/page/setting/settingDetail.dart';
import 'package:flutter_tutorial/page/setting/settingList.dart';
import 'package:flutter_tutorial/page/setting/settingUpdate.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tutorial/page/user/userAdd.dart';
import 'package:flutter_tutorial/page/user/userUpdate.dart';
import 'package:flutter_tutorial/custom/appbar/appBar.dart';
import 'package:flutter_tutorial/page/user/userList.dart';
import 'package:flutter_tutorial/custom/textEditor/textEditor.dart';
import 'package:flutter_tutorial/page/setting/settingAdd.dart';

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
          '/': (context) => EventList(), //기본 설정 값
        },
      ),
    );
  }
}
//
