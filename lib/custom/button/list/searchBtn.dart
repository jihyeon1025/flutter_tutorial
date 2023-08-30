import 'package:flutter/material.dart';

class CustomSearchButton extends StatelessWidget {
  final VoidCallback onPressed;

  CustomSearchButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '추가',
          style: TextStyle(color: Color(0xFF003E65), fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        side: BorderSide(
          color: Color(0xFF003E65),
        ),
        minimumSize: Size(100, 35.0), // 버튼 자체 크기 지정
      ),
    );
  }
}
