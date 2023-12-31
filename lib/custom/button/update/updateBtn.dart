import 'package:flutter/material.dart';

class CustomUpdateButton extends StatelessWidget {
  final VoidCallback onPressed;

  CustomUpdateButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '수정 완료',
          style: TextStyle(color: Colors.white, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        side: BorderSide(
          color: Color(0xFF003E65),
        ),
        backgroundColor: Color(0xFF003E65),
        minimumSize: Size(190, 56), // 버튼 자체 크기 지정
      ),
    );
  }
}
