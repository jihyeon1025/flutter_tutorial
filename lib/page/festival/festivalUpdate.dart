import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorial/custom/appbar/appBar.dart';
import 'package:flutter_tutorial/custom/button/update/cancleBtn.dart';
import 'package:flutter_tutorial/custom/button/update/updateBtn.dart';
import 'package:flutter_tutorial/custom/textEditor/textEditor.dart';
import 'package:flutter_tutorial/custom/button/add/uploadBtn.dart';

void main() {
  runApp(festivalUpdate());
}

class festivalUpdate extends StatefulWidget {
  @override
  _FestivalUpdateState createState() => _FestivalUpdateState();
}

class _FestivalUpdateState extends State<festivalUpdate> {
  late Widget loadedTextEditorWidget; // 로드된 위젯을 저장할 변수
  final _valueList = ['공연', '도보', '전시', '체험'];
  var _selectedValue = '전시';
  final _eventList = ['야경', '야로', '야설', '야사', '야화', '야시', '야식', '야숙'];
  var _selectedValue2 = '야경';

  @override
  void initState() {
    super.initState();
    // addpage 로드 후 불러올 위젯을 여기에 초기화
    loadedTextEditorWidget =
        Container(width: 880, height: 500, child: TextEditor());
  }

  @override
  Widget build(BuildContext context) {
    var hintText;
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
                  '행사 수정',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Container(
                  height: 3,
                  color: Colors.black,
                ),
                SizedBox(height: 30),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 17),
                    child: Row(
                      children: [
                        Text('상태',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(width: 85),
                        Container(
                          width: 883,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(75, 75, 75, 0.5),
                              width: 0.3,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _selectedValue,
                                icon: Icon(Icons.keyboard_arrow_down_outlined),
                                iconSize: 30,
                                elevation: 16,
                                dropdownColor: Colors.white,
                                focusColor: Colors.white,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedValue = value!;
                                  });
                                },
                                items: _valueList.map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(value,
                                          style: TextStyle(
                                            fontSize: 16,
                                          )),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 17),
                    child: Row(
                      children: [
                        Text('야행',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(width: 85),
                        Container(
                          width: 883,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(75, 75, 75, 0.5),
                              width: 0.3,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _selectedValue2,
                                icon: Icon(Icons.keyboard_arrow_down_outlined),
                                iconSize: 30,
                                elevation: 16,
                                dropdownColor: Colors.white,
                                focusColor: Colors.white,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedValue2 = value!;
                                  });
                                },
                                items: _eventList.map((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(value,
                                          style: TextStyle(
                                            fontSize: 16,
                                          )),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 17, right: 20),
                  child: buildTextField("제목", "웰컴 게이트", 56),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 17, right: 20),
                  child: buildTextField("내용", "content", 150),
                ),
                SizedBox(height: 10),
                // 로드된 위젯 사용

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 90),
                      child: Text(
                        "설명",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                    ),
                    // 로드된 위젯 사용
                    loadedTextEditorWidget,
                  ],
                ),
                SizedBox(height: 15),
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
