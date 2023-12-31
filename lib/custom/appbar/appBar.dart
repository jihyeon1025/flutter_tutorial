import 'package:flutter/material.dart';
import 'package:flutter_tutorial/page/cultureHeritage/cultureHeritageList.dart';
import 'package:flutter_tutorial/page/festival/festivalList.dart';
import 'package:flutter_tutorial/page/gallery/galleryList.dart';
import 'package:flutter_tutorial/page/notice/noticeList.dart';
import 'package:flutter_tutorial/page/promotionVideo/promotionVideoList.dart';
import 'package:flutter_tutorial/page/user/userList.dart';
import 'package:flutter_tutorial/login/login.dart';
import 'package:flutter_tutorial/page/setting/settingList.dart';
import 'package:flutter_tutorial/page/event/eventList.dart';
import 'package:flutter_tutorial/page/complaint/complaintList.dart';

class MyAppBarContent extends StatefulWidget implements PreferredSizeWidget {
  //상태관리
  @override
  _MyAppBarContentState createState() => _MyAppBarContentState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyAppBarContentState extends State<MyAppBarContent> {
  String selectedText = ''; // 사용자가 클릭한 텍스트를 저장하는 변수

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildMenuItem(context, '사용자'),
        _buildMenuItem(context, '설정'),
        _buildMenuItem(context, '이벤트'),
        _buildMenuItem(context, '공지사항'),
        _buildMenuItem(context, '민원'),
        _buildMenuItem(context, '행사'),
        _buildMenuItem(context, '갤러리'),
        _buildMenuItem(context, '홍보영상'),
        _buildMenuItem(context, '문화재'),
        _buildMenuItem(context, '민간시설'),
        _buildMenuItem(context, '자주 묻는 질문'),
        _buildMenuItem(context, '질의응답'),
        _buildMenuItem(context, 'PASSWORD'),
        _buildMenuItem(context, 'LOGOUT'),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedText = text; // 클릭한 텍스트를 변수에 저 장
          });
          if (text == '사용자') {
            Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        UserList()));
          }
          if (text == '설정') {
            Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        SettingList()));
          }
          if (text == '이벤트') {
            Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        EventList()));
          }
          if (text == '공지사항') {
            Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        NoticeList()));
          }

          if (text == '민원') {
            Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        ComplaintList()));
          }
          if (text == '행사') {
            Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        FestivalList()));
          }
          if (text == '갤러리') {
            Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        GalleryList()));
          }
          if (text == '홍보영상') {
            Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        PromotionVideoList()));
          }
          if (text == '문화재') {
            Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        CultureHeritageList()));
          }
          if (text == '민간시설') {
            Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        UserList()));
          }
          if (text == '자주묻는질문') {
            Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        UserList()));
          }
          if (text == '질의응답') {
            Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        UserList()));
          }
          if (text == 'PASSWORD') {
            Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        UserList()));
          }
          if (text == 'LOGOUT') {
            Navigator.pushReplacementNamed(
              context,
              '/',
            );
          }
        },
        child: Text(
          text,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
