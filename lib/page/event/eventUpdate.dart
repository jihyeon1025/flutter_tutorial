import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorial/custom/appbar/appBar.dart';
import 'package:flutter_tutorial/custom/button/add/cancleBtn.dart';
import 'package:flutter_tutorial/custom/button/add/addBtn.dart';
import 'package:flutter_tutorial/custom/button/add/updateBtn.dart';
import 'package:flutter_tutorial/custom/button/add/uploadBtn.dart';
import 'package:flutter_tutorial/custom/textEditor/textEditor.dart';
import 'package:flutter_tutorial/custom/datepicker/datePicker.dart';

void main() {
  runApp(eventUpdate());
}

class eventUpdate extends StatefulWidget {
  @override
  _EventUpdateState createState() => _EventUpdateState();
}

class _EventUpdateState extends State<eventUpdate> {
  late Widget loadedTextEditorWidget; // 로드된 위젯을 저장할 변수
  final _valueList = ['진행중', '진행완료'];
  var _selectedValue = '진행중';

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
                  '이벤트 수정',
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
                                fontSize: 21, fontWeight: FontWeight.bold)),
                        SizedBox(width: 85),
                        Container(
                          width: 875,
                          height: 56,
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
                  child: buildTextField("제목", "도보 프로그램 사전예약 오픈", 56),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: buildTextField(
                      "링크",
                      "https://m.booking.naver.com/booking/12/bizes/239984",
                      56),
                ),
                SizedBox(height: 10),

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
                    child: Container(
                      width: 987,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // 보더 색상
                          width: 0.3, // 보더 선의 두께
                        ),
                      ),
                      child: TextField(
                        style: TextStyle(fontSize: 16.0),
                        maxLines: null, // TextField가 세로로 자동으로 늘어나도록 허용
                        decoration: InputDecoration(
                          hintText: hintText,
                          hintStyle:
                              TextStyle(fontSize: 14, color: Colors.black),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 19, horizontal: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    )),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: Center(
                    child: Container(
                      width: 1000,
                      height: 1300,
                      child: Image.asset(
                        'assets/image1.jpeg',
                        fit: BoxFit.fill, // 이미지가 컨테이너에 가득 차도록 조절
                      ),
                    ),
                  ),
                ),
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
