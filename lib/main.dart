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
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 8},
        {'text': 'Green', 'score': 5},
        {'text': 'White', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Cat', 'score': 5},
        {'text': 'Dog', 'score': 6},
        {'text': 'Bird', 'score': 3},
        {'text': 'Snake', 'score': 10},
      ]
    },
    {
      'questionText': 'Who\'s your favourite man?',
      'answers': [
        {'text': 'He', 'score': 5},
        {'text': 'She', 'score': 5},
        {'text': 'We', 'score': 3},
        {'text': 'They', 'score': 3},
      ]
    }
  ];

  int _questionIndex = 0;
  int _totalScore = 0;

  void _answerQuestion(int score) {

    _totalScore += score;

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
          : Result(_totalScore),
    ));
  }
}
