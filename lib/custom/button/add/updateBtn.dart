import 'package:flutter/material.dart';

class CustomUpdateButton extends StatelessWidget {
  final VoidCallback onPressed;

  CustomUpdateButton({required this.onPressed});

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
        minimumSize: Size(190, 56), // 버튼 자체 크기 지정
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '수정',
          style: TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
