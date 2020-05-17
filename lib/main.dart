import 'package:Flutter/quiz.dart';
import 'package:Flutter/result.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': ['Black', 'Red', 'Green', 'White']
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': ['Cat', 'Dog', 'Bird', 'Snake']
    },
    {
      'questionText': 'Who\'s your favourite man?',
      'answers': ['He', 'She', 'We', 'They']
    }
  ];

  int _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Answer Choose $_questionIndex');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My First Page')),
        body: _questionIndex < questions.length
            ? Quiz(
                questions: this.questions,
                questionIndex: this._questionIndex,
                answerQuestion: this._answerQuestion)
            : Result(),
      )
    );
  }
}
