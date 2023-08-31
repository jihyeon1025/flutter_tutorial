import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

void main() {
  runApp(TextEditor());
}

class TextEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: EditorScreen(),
    );
  }
}

class EditorScreen extends StatefulWidget {
  @override
  _EditorScreenState createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  late QuillController _controller;

  @override
  void initState() {
    super.initState();
    _controller = QuillController.basic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity, //크기 똑같게 조정
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.3,
                  color: Color.fromRGBO(75, 75, 75, 0.5),
                ),
              ),
              child: QuillToolbar.basic(
                controller: _controller,
                fontSizeValues: const {
                  'Small': '7',
                  'Medium': '20.5',
                  'Large': '40',
                },
                showAlignmentButtons: false,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.3,
                    color: Color.fromRGBO(75, 75, 75, 0.5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                    ),
                    //input창
                    BoxShadow(
                      color: Colors.white,
                    ),
                  ],
                ),
                child: QuillEditor.basic(
                  controller: _controller,
                  focusNode: FocusNode(),
                  autoFocus: false,
                  readOnly: false,
                  expands: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
