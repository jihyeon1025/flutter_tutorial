import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorial/custom/appbar/appBar.dart';
import 'package:flutter_tutorial/custom/button/update/cancleBtn.dart';
import 'package:flutter_tutorial/custom/button/update/updateBtn.dart';
import 'package:flutter_tutorial/custom/textEditor/textEditor.dart';
import 'package:flutter_tutorial/custom/button/add/uploadBtn.dart';

void main() {
  runApp(complaintUpdate());
}

class complaintUpdate extends StatefulWidget {
  @override
  _ComplaintUpdateState createState() => _ComplaintUpdateState();
}

class _ComplaintUpdateState extends State<complaintUpdate> {
  late Widget loadedTextEditorWidget; // 로드된 위젯을 저장할 변수

  @override
  void initState() {
    super.initState();
    // addpage 로드 후 불러올 위젯을 여기에 초기화
    loadedTextEditorWidget =
        Container(width: 880, height: 500, child: TextEditor());
  }

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
                  '민원 수정',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Container(
                  height: 3,
                  color: Colors.black,
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: buildTextField("제목", "8월 야행 신문", 56),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 90),
                      child: Text(
                        "내용",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                    ),
                    // 로드된 위젯 사용
                    loadedTextEditorWidget,
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: CustomUploadButton(
                          onPressed: () {
                            // 추가 버튼을 눌렀을 때 수행할 동작을 여기에 작성
                          },
                        ),
                      ),
                      Container(
                        width: 883,
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black, // 보더 색상
                            width: 0.1, // 보더 선의 두께
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 120),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: CustomCancelButton(
                        onPressed: () {
                          // 취소 버튼을 눌렀을 때 수행할 동작을 여기에 작성
                        },
                      ),
                    ),
                    CustomUpdateButton(
                      onPressed: () {
                        // 추가 버튼을 눌렀을 때 수행할 동작을 여기에 작성
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

  Widget buildTextField(
    String label,
    String hintText,
    double height,
  ) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 110,
            child: Text(
              label,
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              height: height,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(75, 75, 75, 0.5),
                  width: 0.3,
                ),
              ),
              child: TextField(
                style: TextStyle(fontSize: 16.0),
                maxLines: null, // TextField가 세로로 자동으로 늘어나도록 허용
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 19, horizontal: 16),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
