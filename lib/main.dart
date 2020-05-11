import 'package:flutter/material.dart';
import 'quiz.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizHome(),
    );
  }
}

