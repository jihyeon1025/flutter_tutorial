import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorial/custom/appbar/appBar.dart';
import 'package:flutter_tutorial/custom/button/list/addBtn.dart';
import 'package:flutter_tutorial/custom/button/list/searchBtn.dart';
import 'package:flutter_tutorial/custom/button/list/deleteBtn.dart';
import 'package:flutter_tutorial/custom/checkbox/CheckboxExample.dart';
import 'package:flutter_tutorial/page/user/userAdd.dart';
import 'package:flutter_tutorial/page/user/userUpdate.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final _valueList = ['전체보기', '이름', '이메일', '소속', '권한'];
  var _selectedValue = '전체보기';

  List<Map<String, dynamic>> settingData = [
    {
      'ID': '1',
      '이름': '전지현',
      '이메일': 'ajjh25500@gmail.com',
      '소속': '회사',
      '권한': 'ADMIN',
      '최근접속시간': '2023-08-17',
    },
    {
      'ID': '2',
      '이름': '유영훈',
      '이메일': 'younghoon@naver.com',
      '소속': 'holich',
      '권한': 'ADMIN',
      '최근접속시간': '2023-03-05',
    },
    {
      'ID': '3',
      '이름': '전혜란',
      '이메일': 'hyeran.jeon@holich.net',
      '소속': 'holich',
      '권한': 'ADMIN',
      '최근접속시간': '2023-02-19',
    },
    {
      'ID': '4',
      '이름': '석지훈',
      '이메일': 'jihoon.seok@holich.net',
      '소속': 'holich',
      '권한': 'ADMIN',
      '최근접속시간': '2021-06-05',
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
                      '사용자 목록',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CustomSearchButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      userAdd()));
                    },
                  ),
                  SizedBox(width: 22),
                  CustomDeleteButton(
                    onPressed: () {
                      // Delete 버튼을 눌렀을 때 수행할 동작을 여기에 작성
                    },
                  ),
                  SizedBox(width: 510),
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
                              color: Colors.black, fontWeight: FontWeight.bold),
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
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0.0)),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(75, 75, 75, 0.5),
                            width: 0.3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0.0)),
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
                                '이름',
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
                                '이메일',
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
                                '소속',
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
                                '권한',
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
                                '최근 접속 시간',
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
                                      userUpdate()));
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
                                    event['이름'],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    event['이메일'],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    event['소속'],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    event['권한'],
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    event['최근접속시간'],
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
