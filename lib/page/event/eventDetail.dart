import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorial/custom/appbar/appBar.dart';
import 'package:flutter_tutorial/custom/button/detail/listBtn.dart';
import 'package:flutter_tutorial/custom/button/detail/updateBtn.dart';
import 'package:flutter_tutorial/custom/button/detail/deleteBtn.dart';
import 'package:flutter_tutorial/page/event/eventUpdate.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(EventDetail());
}

class EventDetail extends StatefulWidget {
  @override
  _EventDetailState createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
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
                    '이벤트 안내',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 3,
                    color: Colors.black,
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 1005,
                    height: 1400,
                    child: Image.asset(
                      'assets/image1.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Text(
                        "CLOSE",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "2023 인천개항장 문화재야행 쿠폰 받자!",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "2023.08.22 - 2023.08.31",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "2023 인천개항장 문화재야행 쿠폰 받자!",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "html/notice/noticeDetail.html?&noticeId=54",
                          style:
                              TextStyle(fontSize: 14, color: Color(0xFF0000EE)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(
                                  'html/notice/noticeDetail.html?&noticeId=54'); // 실제 URL로 변경
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 200),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // 가로 중앙 정렬
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: CustomListButton(
                          onPressed: () {
                            // 추가 버튼을 눌렀을 때 수행할 동작을 여기에 작성
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: CustomUpdateButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        eventUpdate()));
                          },
                        ),
                      ),
                      CustomDeleteButton(
                        onPressed: () {
                          // 삭제 버튼을 눌렀을 때 수행할 동작을 여기에 작성
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
