import 'package:first_app/result.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'questionText': 'Which multiplayer game has most users?',
      'answers': [
        {'text': 'League of Legends', 'Score': 200},
        {'text': 'Counter Strike', 'Score': 100},
        {'text': 'Valorant', 'Score': 200},
        {'text': 'Dota2', 'Score': 300}
      ],
    },
    {
      'questionText': 'By which platform people watch games mostly on?',
      'answers': [
        {'text': 'Facebook', 'Score': 100},
        {'text': 'Twitch', 'Score': 200},
        {'text': 'Youtube', 'Score': 300},
        {'text': 'VK', 'Score': 100}
      ],
    },
    {
      'questionText': 'Which Company Sponsor most on gaming industry?',
      'answers': [
        {'text': 'Intel', 'Score': 300},
        {'text': 'Amd', 'Score': 200},
        {'text': 'Apple', 'Score': 100},
        {'text': 'Walton', 'Score': 0}
      ],
    },
    {
      'questionText': 'What\'s Peoples favourite game?',
      'answers': [
        {'text': 'League of Legends', 'Score': 200},
        {'text': 'Minecraft', 'Score': 0},
        {'text': 'Valorant', 'Score': 200},
        {'text': 'Dota2', 'Score': 300}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('objection of questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : result(_totalScore, _resetQuiz),
      ),
    );
  }
}
