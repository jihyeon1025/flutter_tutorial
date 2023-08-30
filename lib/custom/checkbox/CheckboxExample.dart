import 'package:flutter/material.dart';

class JHCheckbox extends StatefulWidget {
  const JHCheckbox({super.key});

  @override
  State<JHCheckbox> createState() => _JHCheckboxState();
}

class _JHCheckboxState extends State<JHCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: GestureDetector(
        child: Transform.scale(
          scale: 1.2,
          child: Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(
              (states) {
                if (isChecked) {
                  return Colors.blue; // 체크된 상태에서 파란색으로 채우기
                } else {
                  return Colors.white; // 체크되지 않은 상태에서는 흰색으로 채우기
                }
              },
            ),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
        ),
      ),
    );
  }
}
