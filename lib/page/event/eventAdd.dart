import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorial/custom/appbar/appBar.dart';
import 'package:flutter_tutorial/custom/button/add/cancleBtn.dart';
import 'package:flutter_tutorial/custom/button/add/addBtn.dart';
import 'package:flutter_tutorial/custom/textEditor/textEditor.dart';
import 'package:flutter_tutorial/custom/datepicker/datePicker.dart';

void main() {
  runApp(eventAdd());
}

class eventAdd extends StatefulWidget {
  @override
  _EventAddState createState() => _EventAddState();
}

class _EventAddState extends State<eventAdd> {
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
                  '이벤트 추가',
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
                  child: buildTextField("상태", "수정필요", 56),
                ),

                Container(
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          "기간",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 83),
                          child: Container(
                              width: 200,
                              height: 100,
                              child: DatePickerExample()),
                        ),
                        Container(
                          width: 20, // 수직 선의 너비
                          color: Colors.black, // 선의 색상 이벤트
                          height: 2,
                        ),
                        const SizedBox(width: 10), // 데이터 피커와 선 사이의 간격 조정
                        Container(
                            width: 200,
                            height: 200,
                            child: DatePickerExample()),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: buildTextField("제목", "재목을 입력해주세요", 56),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: buildTextField("링크", "링크를 입력해주세요.", 56),
                ),
                SizedBox(height: 10),

                SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 22, right: 90, bottom: 15),
                      child: Text(
                        "내용",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                // 로드된 위젯 사용
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: loadedTextEditorWidget,
                    ),
                  ],
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
                    CustomAddButton(
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
