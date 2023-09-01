import 'package:flutter/material.dart';

class CustomUploadButton extends StatelessWidget {
  final VoidCallback onPressed;

  CustomUploadButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '업로드',
          style: TextStyle(color: Color(0xFF888888), fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        side: BorderSide(
          color: Color(0xFFE5E5E5),
        ),
        minimumSize: Size(120, 65), // 버튼 자체 크기 지정
      ),
    );
  }
}
