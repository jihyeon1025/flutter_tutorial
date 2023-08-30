import 'package:flutter/material.dart';

class CustomAddButton extends StatelessWidget {
  final VoidCallback onPressed;

  CustomAddButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Color(0xFF003E65), // 배경색 지정
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0), // 버튼 모서리를 사각
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        side: BorderSide(
          color: Color(0xFF003E65),
        ),
        minimumSize: Size(80, 36), // 버튼 자체 크기 지정
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '검색',
          style: TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
