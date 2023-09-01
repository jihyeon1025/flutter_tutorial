import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorial/custom/appbar/appBar.dart';
import 'package:flutter_tutorial/custom/button/add/cancleBtn.dart';
import 'package:flutter_tutorial/custom/button/add/addBtn.dart';
import 'package:flutter_tutorial/custom/button/add/updateBtn.dart';
import 'package:flutter_tutorial/custom/button/add/uploadBtn.dart';
import 'package:flutter_tutorial/custom/textEditor/textEditor.dart';
import 'package:flutter_tutorial/custom/datepicker/datePicker.dart';
import 'package:flutter_tutorial/custom/textEditor/textEditor.dart';

void main() {
  runApp(promotionvideoUpdate());
}

class promotionvideoUpdate extends StatefulWidget {
  @override
  _PromotionVideoUpdateState createState() => _PromotionVideoUpdateState();
}

class _PromotionVideoUpdateState extends State<promotionvideoUpdate> {
  late Widget loadedTextEditorWidget; // 로드된 위젯을 저장할 변수

  @override
  void initState() {
    super.initState();
    // addpage 로드 후 불러올 위젯을 여기에 초기화
    loadedTextEditorWidget =
        Container(width: 990, height: 550, child: TextEditor());
  }

  @override
  Widget build(BuildContext context) {
    var hintText = '2023 인천개항장 문화재야행 쿠폰 받자!';
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
                  '홍보영상 수정',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Container(
                  height: 3,
                  color: Colors.black,
                ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 70, left: 15),
                      child: Text(
                        "행사일",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        width: 200, height: 90, child: DatePickerExample()),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: buildTextField("제목", "도보 프로그램 사전예약 오픈", 56),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: buildTextField(
                      "링크",
                      "https://m.booking.naver.com/booking/12/bizes/239984",
                      56),
                ),
                SizedBox(height: 20),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 22, bottom: 15),
                      child: Text(
                        "내용",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                // 로드된 위젯 사용
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      // 로드된 위젯 사용
                      loadedTextEditorWidget,
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CustomUploadButton(
                            onPressed: () {
                              // 추가 버튼을 눌렀을 때 수행할 동작을 여기에 작성
                            },
                          ),
                        ),
                        Container(
                          width: 867,
                          height: 55,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey, // 보더 색상
                              width: 0.3, // 보더 선의 두께
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                ),

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
