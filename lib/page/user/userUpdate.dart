import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorial/custom/appbar/appBar.dart';
import 'package:flutter_tutorial/custom/button/update/cancleBtn.dart';
import 'package:flutter_tutorial/custom/button/update/updateBtn.dart';
import 'package:flutter_tutorial/custom/button/update/deleteBtn.dart';

void main() {
  runApp(userUpdate());
}

class userUpdate extends StatelessWidget {
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
                '사용자 정보 수정',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Container(
                height: 3,
                color: Colors.black,
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: buildTextField("jihyeon.jeon@holich.net"),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: buildTextField("전지현"),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: buildTextField("회사"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: CustomDeleteButton(
                      onPressed: () {
                        // 추가 버튼을 눌렀을 때 수행할 동작을 여기에 작성
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
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
    );
  }

  Widget buildTextField(String hintText) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 56,
            child: TextField(
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 19, horizontal: 16),
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
        ),
      ],
    );
  }
}
