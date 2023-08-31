import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorial/custom/appbar/appBar.dart';
import 'package:flutter_tutorial/custom/button/list/addBtn.dart';
import 'package:flutter_tutorial/custom/button/list/searchBtn.dart';
import 'package:flutter_tutorial/custom/button/list/deleteBtn.dart';
import 'package:flutter_tutorial/custom/checkbox/CheckboxExample.dart';
import 'package:flutter_tutorial/page/setting/settingAdd.dart';
import 'package:flutter_tutorial/page/setting/settingDetail.dart';
import 'package:flutter_tutorial/custom/datepicker/datePicker.dart';

class SettingList extends StatefulWidget {
  @override
  _SettingListState createState() => _SettingListState();
}

class _SettingListState extends State<SettingList> {
  final _valueList = ['전체보기', '이름', '이메일', '소속', '권한'];
  var _selectedValue = '전체보기';

  List<Map<String, dynamic>> settingData = [
    {
      'ID': '1',
      '코드': 'PROMOTION_VIDEO_LINK',
      '제목': 'https://www.youtube.com/embed/f_eS74TTVWs',
      '작성자': '전지현',
      '작성일': '2023.08.07 15:14',
    },
    {
      'ID': '2',
      '코드': 'PROMOTION_VIDEO_LINK',
      '제목': 'https://www.youtube.com/embed/f_eS74TTVWs',
      '작성자': '김지현',
      '작성일': '2022.08.07 10:22',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //delete history back button
        automaticallyImplyLeading: false,
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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, bottom: 50, left: 670),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 48),
                    child: Text(
                      '설정 목록',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Container(
                height: 40,
                child: Row(
                  children: [
                    CustomSearchButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        settingAdd()));
                      },
                    ),
                    SizedBox(width: 22),
                    CustomDeleteButton(
                      onPressed: () {
                        // Delete 버튼을 눌렀을 때 수행할 동작을 여기에 작성
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 105),
                      child: Container(
                          width: 200, height: 200, child: DatePickerExample()),
                    ),
                    Container(
                      width: 20, // 수직 선의 너비
                      color: Colors.black, // 선의 색상 설정
                      height: 2,
                    ),
                    const SizedBox(width: 10), // 데이터 피커와 선 사이의 간격 조정
                    Container(
                        width: 200, height: 200, child: DatePickerExample()),
                    Container(
                      width: 180,
                      height: 36,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
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
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value!;
                              });
                            },
                            items: _valueList.map((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: 252,
                      height: 38,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.3,
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: TextField(
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                          hintText: '검색어를 입력해주세요.',
                          hintStyle:
                              TextStyle(fontSize: 16, color: Colors.black54),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 16),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0)),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(75, 75, 75, 0.5),
                              width: 0.3,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0)),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(75, 75, 75, 0.5),
                              width: 0.3,
                            ),
                          ),
                        ),
                      ),
                    ),
                    CustomAddButton(
                      onPressed: () {
                        // 검색 버튼을 눌렀을 때 수행할 동작을 여기에 작성
                      },
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 29),
                    child: Container(
                      width: 1240,
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.black, width: 3.0),
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 7),
                            child: JHCheckbox(),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                'ID',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                '코드',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                '제목',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                '작성자',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                '작성일',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: List.generate(settingData.length, (index) {
                      Map<String, dynamic> event = settingData[index];
                      return GestureDetector(
                        onTap: () {
                          // 각 사용자 항목 클릭 시 페이지 이동
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      SettingDetail()));
                        },
                        child: Container(
                          width: 1240,
                          height: 55,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 0.5,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 7),
                                child: JHCheckbox(),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    event['ID'],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    event['코드'],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    event['제목'],
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.center, // 텍스트를 가운데 정렬
                                    overflow:
                                        TextOverflow.visible, // 넘치는 텍스트는 보이게 처리
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    event['작성자'],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    event['작성일'],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
