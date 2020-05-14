import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Answer Choose $_questionIndex');
  }

  @override
  Widget build(BuildContext context) {
    List<String> questions = ['Animal?', 'Color?'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('My First Page')
        ),
        body: Column(children: <Widget>[
          Text(questions.elementAt(_questionIndex)),
          RaisedButton(
            child: Text('Answer1'),
            onPressed: _answerQuestion,
          ),
          RaisedButton(
            child: Text('Answer2'),
            onPressed: () {
              print('An. Func');
            },
          )
        ],
        ),
      )
    );
  }
}