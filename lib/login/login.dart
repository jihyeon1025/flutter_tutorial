import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorial/page/user/userList.dart'; //이동할 패이지 임포트

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Widget',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 560;

    return Scaffold(
      body: isMobile
          ? buildMobileLayout(context)
          : buildDesktopLayout(context), //모바일이면 모바일 레이아웃 , 아니면 데스크탑 레이아웃
    );
  }

  Widget buildMobileLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text('ㅡ',
                    style: TextStyle(color: Colors.black, fontSize: 36)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('관리자 로그인',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 36)),
              ),
              SizedBox(height: 20),
              TextField(
                cursorColor: Colors.black,
                style: TextStyle(fontSize: 16.0),
                decoration: InputDecoration(
                  hintText: '이메일',
                  hintStyle: TextStyle(fontSize: 16, color: Color(0xFF111111)),
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
              SizedBox(height: 10),
              TextField(
                style: TextStyle(fontSize: 16.0),
                decoration: InputDecoration(
                  hintText: '비밀번호',
                  hintStyle: TextStyle(fontSize: 16, color: Color(0xFF111111)),
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
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  //로그인 버튼 클릭시 UserList 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserList(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Color(0xFF003E65),
                    border: Border.all(
                      color: Color(0xFF003E65),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Center(
                    child: Text(
                      '로그인',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Color(0xFF003E65),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/logo.svg',
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 80, top: 80),
                  child: Text('ㅡ',
                      style: TextStyle(color: Colors.white, fontSize: 48)),
                ),
                Column(
                  children: [
                    Text(
                      '인천 개항장 문화재 야행은',
                      style: TextStyle(color: Colors.white, fontSize: 43),
                    ),
                    Text(
                      '문화재청과 함께하고 있습니다.',
                      style: TextStyle(color: Colors.white, fontSize: 43),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 435),
                  child: Text('ㅡ',
                      style: TextStyle(color: Colors.black, fontSize: 36)),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 435),
                  child: Text('관리자 로그인',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 36)),
                ),
              ),
              SizedBox(height: 30),
              Column(
                children: [
                  Container(
                    width: 400,
                    height: 56,
                    child: TextField(
                      cursorColor: Colors.black,
                      style: TextStyle(fontSize: 16.0),
                      decoration: InputDecoration(
                        hintText: '이메일',
                        hintStyle:
                            TextStyle(fontSize: 16, color: Color(0xFF111111)),
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
                  SizedBox(height: 10),
                  Container(
                    width: 400,
                    height: 56,
                    child: TextField(
                      style: TextStyle(fontSize: 16.0),
                      decoration: InputDecoration(
                        hintText: '비밀번호',
                        hintStyle:
                            TextStyle(fontSize: 16, color: Color(0xFF111111)),
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
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      //로그인 버튼 클릭시 UserList 이동
                      Navigator.push(
                          context,
                          // 기본 위젯 이동시 나오는 애니메이션 제거
                          PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      UserList()));
                    },
                    child: Container(
                      width: 400,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Color(0xFF003E65),
                        border: Border.all(
                          color: Color(0xFF003E65),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Center(
                        child: Text(
                          '로그인',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
