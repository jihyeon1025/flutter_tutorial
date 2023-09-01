import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorial/custom/appbar/appBar.dart';
import 'package:flutter_tutorial/custom/button/detail/listBtn.dart';
import 'package:flutter_tutorial/custom/button/detail/updateBtn.dart';
import 'package:flutter_tutorial/page/complaint/complaintUpdate.dart';
import 'package:flutter_tutorial/custom/button/detail/deleteBtn.dart';

void main() {
  runApp(ComplaintDetail());
}

class ComplaintDetail extends StatefulWidget {
  @override
  _ComplaintDetailState createState() => _ComplaintDetailState();
}

class _ComplaintDetailState extends State<ComplaintDetail> {
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 100, bottom: 50, left: 760, right: 760),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '민원',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Container(
                  height: 3,
                  color: Colors.black,
                ),
                SizedBox(height: 30),
                buildTextFieldRow("제목", "8월 야행 신문"),
                SizedBox(height: 10),
                buildTextFieldRow("내용", "8월 야행 신문"),
                SizedBox(height: 10),
                Container(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.1, color: Colors.black), // 아랫쪽 까만 1px 보더
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25, left: 30, bottom: 25),
                          child: Text("파일",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 80),
                          child: Text("24_2028-DBF_8046.jpg",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                buildTextFieldRow("이메일", "shadow939590@gmail.com"),
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
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: CustomUpdateButton(
                        onPressed: () {
                          // 각 사용자 항목 클릭 시 페이지 이동
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      complaintUpdate()));
                        },
                      ),
                    ),
                    CustomDeleteButton(
                      onPressed: () {
                        // 각 사용자 항목 클릭 시 페이지 이동
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        complaintUpdate()));
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFieldRow(String label, String hintText) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(width: 0.1, color: Colors.black), // 아랫쪽 까만 1px 보더
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
