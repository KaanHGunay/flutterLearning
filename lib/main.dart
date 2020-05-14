import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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
    var questions = [
      {'questionText': 'What\'s your favourite color?', 'answers': [
        'Black', 'Red', 'Green', 'White'
      ]},
      {'questionText': 'What\'s your favourite animal?', 'answers': [
        'Cat', 'Dog', 'Bird', 'Snake'
      ]},
      {'questionText': 'Who\'s your favourite man?', 'answers': [
        'He', 'She', 'We', 'They'
      ]}
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('My First Page')
        ),
        body: Column(children: <Widget>[
          Question(questions[_questionIndex]['questionText']),
          ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
            return Answer(_answerQuestion, answer);
          })
        ],
        ),
      )
    );
  }
}