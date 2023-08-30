import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorial/custom/appbar/appBar.dart';
import 'package:flutter_tutorial/custom/button/detail/listBtn.dart';
import 'package:flutter_tutorial/custom/button/detail/updateBtn.dart';
import 'package:flutter_tutorial/page/setting/settingUpdate.dart';

void main() {
  runApp(SettingDetail());
}

class SettingDetail extends StatefulWidget {
  @override
  _SettingDetailState createState() => _SettingDetailState();
}

class _SettingDetailState extends State<SettingDetail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Color(0xFF003E65),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: SvgPicture.asset(
                  'assets/logo.svg',
                  height: 35,
                ),
              ),
              MyAppBarContent(),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
              top: 100, bottom: 50, left: 760, right: 760),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '설정 상세',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Container(
                height: 3,
                color: Colors.black,
              ),
              SizedBox(height: 30),
              buildTextFieldRow("코드", "PROMOTION_VIDEO_LINK"),
              SizedBox(height: 10),
              buildTextFieldRow(
                  "제목", "https://www.youtube.com/embed/f_eS74TTVWs"),
              SizedBox(height: 10),
              buildContentSquare("내용", "테스트 내용입니다."),
              SizedBox(height: 10),
              buildTextFieldRow("작성자", "석지훈"),
              SizedBox(height: 10),
              buildTextFieldRow("작성일", "2023.08.07 15:14"),
              SizedBox(height: 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: CustomListButton(
                      onPressed: () {
                        // 취소 버튼을 눌렀을 때 수행할 동작을 여기에 작성
                      },
                    ),
                  ),
                  CustomUpdateButton(
                    onPressed: () {
                      // 각 사용자 항목 클릭 시 페이지 이동
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      settingUpdate()));
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

//내용만
  Widget buildContentSquare(String label, String content) {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 30),
      decoration: BoxDecoration(
        color: Color(0xFFF0F0F0), // Background color
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              width: 1050,
              height: 60,
              color: Color(0xFFF0F0F0),
              child: Text(content, style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextFieldRow(String label, String hintText) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFFF0F0F0), // Background color
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(width: 0.3, color: Colors.grey),
              ),
            ),
            padding: const EdgeInsets.only(left: 7),
            child: Text(
              label,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 48,
              color: Color(0xFFF0F0F0),
              child: TextField(
                style: TextStyle(fontSize: 16.0),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 19, horizontal: 16),
                  border: InputBorder.none,
                ),
                enabled: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
