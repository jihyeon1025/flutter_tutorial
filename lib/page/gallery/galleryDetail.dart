import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tutorial/custom/appbar/appBar.dart';
import 'package:flutter_tutorial/custom/button/detail/listBtn.dart';
import 'package:flutter_tutorial/custom/button/detail/updateBtn.dart';
import 'package:flutter_tutorial/page/gallery/galleryUpdate.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(GalleryDetail());
}

class GalleryDetail extends StatefulWidget {
  @override
  _GalleryDetailState createState() => _GalleryDetailState();
}

class _GalleryDetailState extends State<GalleryDetail> {
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
                  '갤러리',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Container(
                  height: 3,
                  color: Colors.black,
                ),
                SizedBox(height: 30),
                buildTextFieldRow("행사기간", "2022년 10월 10일"),
                SizedBox(height: 10),
                buildTextFieldRow("제목", "2022 인천개항장 문화재 야행-1야행-야로-인천e지 스탬프투어"),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.1, color: Colors.black), // 아랫쪽 까만 1px 보더
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text("내용",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Center(
                              child: Container(
                                width: 963,
                                height: 1300,
                                child: Image.asset(
                                  'assets/image1.jpeg',
                                  fit: BoxFit.fill, // 이미지가 컨테이너에 가득 차도록 조절
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                buildTextFieldRow("작성자", "석지훈"),
                SizedBox(height: 10),
                buildTextFieldRow("작성일", "2023.08.07 15:14"),
                SizedBox(height: 150),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: CustomListButton(
                        onPressed: () {
                          // 취소 버튼을 눌렀을 때 수행할 동작을 여기에 작성
                        },
                      ),
                    ),
                    CustomUpdateButton(
                      onPressed: () {
                        // 각 사용자 항목 클릭 시 페이지 이동
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        galleryUpdate()));
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

//내용만
  Widget buildContentSquare(String label, String content) {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 30),
      decoration: BoxDecoration(
        border: Border.all(width: 0.1, color: Colors.black), // 아랫쪽 까만 1px 보더
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              width: 1050,
              height: 60,
              // color: Color(0xFFF0F0F0),
              child: Text(content, style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextFieldRow(String label, String hintText) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(width: 0.1, color: Colors.black), // 아랫쪽 까만 1px 보더
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(width: 0.3, color: Colors.grey),
              ),
            ),
            padding: const EdgeInsets.only(left: 7),
            child: Text(
              label,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 48,
              child: TextField(
                style: TextStyle(fontSize: 16.0),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 19, horizontal: 16),
                  border: InputBorder.none,
                ),
                enabled: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
