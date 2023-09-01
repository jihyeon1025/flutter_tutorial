import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorial/custom/appbar/appBar.dart';
import 'package:flutter_tutorial/custom/button/list/addBtn.dart';
import 'package:flutter_tutorial/custom/button/list/searchBtn.dart';
import 'package:flutter_tutorial/custom/button/list/deleteBtn.dart';
import 'package:flutter_tutorial/custom/checkbox/CheckboxExample.dart';
import 'package:flutter_tutorial/page/festival/festivalAdd.dart';
import 'package:flutter_tutorial/page/festival/festivalDetail.dart';
import 'package:flutter_tutorial/custom/datepicker/datePicker.dart';

class FestivalList extends StatefulWidget {
  @override
  _FestivalListState createState() => _FestivalListState();
}

class _FestivalListState extends State<FestivalList> {
  final _valueList = ['전체보기', '제목', '내용', '행사유형', '야행'];
  var _selectedValue = '전체보기';

  List<Map<String, dynamic>> festivalData = [
    {
      'ID': '1',
      '이미지': 'assets/festivalimage2.jpeg',
      '행사유형': '전시',
      '야행': '야경',
      '제목': '웰컴 게이트',
      '등록날짜': '2023.08.07 15:14',
    },
    {
      'ID': '2',
      '이미지': 'assets/festivalimage2.jpeg',
      '행사유형': '전시',
      '야행': '야사',
      '제목': '문화재 미디어 아트',
      '등록날짜': '2023.08.07 15:14',
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
                      '행사',
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
                                        festivalAdd()));
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
                      color: Colors.black, // 선의 색상 행사
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
                                '이미지',
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
                                '행사유형',
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
                                '야행',
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
                                '등록날짜',
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
              Container(
                child: Row(
                  children: [
                    Column(
                      children: List.generate(festivalData.length, (index) {
                        Map<String, dynamic> event = festivalData[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        FestivalDetail()));
                          },
                          child: Container(
                            width: 1240,
                            height: 104,
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
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    child: Center(
                                      child: Container(
                                        width: 200,
                                        height: 104,
                                        child: Image.asset(
                                          'assets/image2.jpeg',
                                          fit: BoxFit
                                              .fill, // 이미지가 컨테이너에 가득 차도록 조절
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      event['행사유형'],
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      event['야행'],
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      event['제목'],
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      event['등록날짜'],
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
