import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorial/custom/appbar/appBar.dart';
import 'package:flutter_tutorial/custom/button/update/cancleBtn.dart';
import 'package:flutter_tutorial/custom/button/update/updateBtn.dart';

void main() {
  runApp(userAdd());
}

class userAdd extends StatefulWidget {
  @override
  _UserAddState createState() => _UserAddState();
}

class _UserAddState extends State<userAdd> {
  final _valueList = ['ADMIN', 'USER'];
  var _selectedValue = 'ADMIN';

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
                '사용자 등록',
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
                child: buildTextField("이메일", "이메일을 입력해주세요."),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: buildTextField("비밀번호", "비밀번호를 입력해주세요."),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: buildTextField("이름", "이름을 입력해주세요."),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: buildTextField("소속", "소속을 입력해주세요."),
              ),
              SizedBox(height: 10),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: Row(
                    children: [
                      Text('상태',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(width: 85),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          width: 872,
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
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 150),
              // Container(
              //   width: 180,
              //   height: 36,
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       color: Colors.black,
              //       width: 0.3,
              //     ),
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(
              //       horizontal: 8.0,
              //     ),
              //     child: DropdownButtonHideUnderline(
              //       child: DropdownButton<String>(
              //         value: _selectedValue,
              //         icon: Icon(Icons.keyboard_arrow_down_outlined),
              //         iconSize: 30,
              //         elevation: 16,
              //         dropdownColor: Colors.white,
              //         focusColor: Colors.white,
              //         style: TextStyle(
              //             color: Colors.black, fontWeight: FontWeight.bold),
              //         onChanged: (value) {
              //           setState(() {
              //             _selectedValue = value!;
              //           });
              //         },
              //         items: _valueList.map((value) {
              //           return DropdownMenuItem<String>(
              //             value: value,
              //             child: Text(value),
              //           );
              //         }).toList(),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: 150),
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
    );
  }

  Widget buildTextField(String label, String hintText) {
    return Row(
      children: [
        Container(
          width: 110,
          child: Text(
            label,
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Container(
            height: 56,
            child: TextField(
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 14, color: Colors.black54),
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
