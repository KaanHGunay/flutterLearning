import 'package:first_homework/change_button.dart';
import 'package:first_homework/screen_text.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int i = 0;
  String _text = 'Try';

  void changeText() {
    setState(() {
      _text = 'Try ${++i}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('First Homework'),),
        body: Column(
          children: <Widget>[
            ScreenText(_text),
            ChangeButton(this.changeText)
          ],
        ),
      ),
    );
  }
}
