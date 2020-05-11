import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myquizapp/quiz_brain.dart';
import 'summary.dart';


//QuizBrain quiz = QuizBrain();

class QuizHome extends StatefulWidget {

  @override
  _QuizHomeState createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
    int _scoreCounter = 0;
    int  questionNumber = 1;


    List<Map> questionBank = [
      {
        'question' : 'Who was the father of computer?',
        'options' : [
          'Charles Babbage', 'Dennis Ritchie', 'Kenny Rogers', 'Ken Thompson'
        ],
        'answer' : 'Charles Babbage',
      },
      {
        'question' : 'What is the full form of ALU?',
        'options' : [
          'Charles Babbage', 'Dennis Ritchie', 'Kenny Rogers', 'Ken Thompson'
        ],
        'answer' : 'Arithmetic Logic Unit',
      },
      {
        'question' : 'What is the full form of MU?',
        'options' : [
          'Authentication Local Unit', 'Arithmetic Logic Unit','Advance Logical Unit', 'None of these'
        ],
        'answer' : 'Memory Unit',
      },
      {
        'question' : 'What is the full form of CU?',
        'options' : [
          'Compound Unit', 'Communication Unit','Control Unit', 'Computer Unit'
        ],
        'answer' : 'Control Unit',
      },
      {
        'question': 'What is the full form of CPU?',
        'options': [
          'Central Processing Unit',
          'Contral Processing Unit',
          'Central Progressive Unit',
          'Central Processing Unit',
        ],
        'answer': 'Central Processing Unit',
      }
    ];

    // implement next question
    void _incrementCounter() {
      setState(
            () {
          if (questionNumber < questionBank.length - 1) {
            questionNumber++;
            choice = false;
          } else if (questionNumber == questionBank.length - 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Summary(_scoreCounter),
              ),
            );
          } else {
           questionNumber += 0;
          }
        },
      );
  }


@override
  Widget build(BuildContext context) {

  List option = questionBank[_scoreCounter]['options'];
  String answer = questionBank[_scoreCounter]['answer'];

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade800,
      body: Padding(
        padding: const EdgeInsets.only(left: 50, right: 16.0, top: 10.0, bottom: 10.0),
        child: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Text(
                    'Question $questionNumber',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.amber,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 5.0),
                  child: Text(
                    questionBank[_scoreCounter]['question'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    option1(
                        option: option[0],
                        answer: questionBank[_scoreCounter]['answer']),
                  option2(
                      option: option[1],
                      answer: questionBank[_scoreCounter]['answer']),
                  option3(
                      option: option[2],
                      answer: questionBank[_scoreCounter]['answer']),
                  option4(
                      option: option[3],
                      answer: questionBank[_scoreCounter]['answer']),
                    FlatButton(
                      color: Colors.white,
                      splashColor: Colors.tealAccent.shade100,
                      onPressed: () {
                        setState(() {
                          if (choice == true) {
                            _incrementCounter();
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5, left: 5, right: 5, bottom: 5),
                        child: Text(
                          'Next Question',
                          style: TextStyle(
                              color: Colors.blueGrey.shade800,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Your score is $_scoreCounter',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.amber
                        ),
                      ),
                    )
                  ],
                ),
              ]
            ),
          )
      )
    )
  );
  }
  // bool to hel toggle through colors
  bool choice = false;

    // start up colors for the colors for the buttons
    Color color1 = Colors.grey;
    Color color2 = Colors.grey;
    Color color3 = Colors.grey;
    Color color4 = Colors.grey;

    // increament the score
    userPickedAnswer(String answer) {
      if (answer == questionBank[_scoreCounter]['answer']) {
        _scoreCounter ++;
      } else {
        _scoreCounter += 0;
      }
    }

// set the option green even if the answer is wrong
  void changeColor(String userPickedAnswer){
    List options = questionBank[_scoreCounter]['options'];

    setState(() {
      color1 = Colors.grey;
      color2 = Colors.grey;
      color3 = Colors.grey;
      color4 = Colors.grey;
    });

    setState(() {
      for (var i = 0; i < options.length; i++) {
        if (options[i] == userPickedAnswer) {
          if (i == 0) {
            setState(() {
              color1 = Colors.green;
            });
          } else if (i == 1) {
            setState(() {
              color2 = Colors.green;
            });
          } else if (i == 2) {
            setState(() {
              color3 = Colors.green;
            });
          } else if (i == 3) {
            setState(() {
              color4 = Colors.green;
            });
          }
        }
      }
    });
    }


    // widget for options
    Widget option1({String option, String answer}) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: FlatButton(
            padding: EdgeInsets.all(15.0),
            onPressed: () {
              if (choice == false) {
                changeColor(userPickedAnswer(answer));
                setState(() {
                  choice = true;
                  color1 = option == answer ? Colors.green : Colors.red;

                  userPickedAnswer(answer);
//                  if (question == questionBank[_scoreCounter]['answer']) {
//                    _scoreCounter ++;
//                  }
                });
              }
            },
            child: Text(option),
            color: choice == true ? color1 : Colors.grey,
            splashColor: Colors.tealAccent.shade100,
            ),
          ),
        );
    }

    Widget option2({String option, String answer}) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: FlatButton(
            padding: EdgeInsets.all(15.0),
            onPressed: () {
              if (choice == false) {
                changeColor(userPickedAnswer(answer) );
                setState(() {
                  choice = true;
                  color2 = option == answer ? Colors.green : Colors.red;

                  userPickedAnswer(answer);
//                  if (question == questionBank[_scoreCounter]['answer']) {
//                    _scoreCounter ++;
//                  }
                });
              }
            },
            child: Text(option),
            color: choice == true ? color2 : Colors.grey,
            splashColor: Colors.tealAccent.shade100,
            ),
          ),
        );
    }

    Widget option3({String option, String answer}) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: FlatButton(
            padding: EdgeInsets.all(15.0),
            onPressed: () {
              if (choice == false) {
                changeColor(userPickedAnswer(answer));
                setState(() {
                  choice = true;
                  color3 = option == answer ? Colors.green : Colors.red;
                  userPickedAnswer(answer);
//                  if (question == questionBank[_scoreCounter]['answer']) {
//                    _scoreCounter ++;
//                  }
                });
              }
            },
            child: Text(option),
            color: choice == true ? color3 : Colors.grey,
            splashColor: Colors.tealAccent.shade100,
            ),
          ),
        );
    }

    Widget option4({String option, String answer}) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: FlatButton(
            padding: EdgeInsets.all(15.0),
            onPressed: () {
              if (choice == false) {
                changeColor(userPickedAnswer(answer));
                setState(() {
                  choice = true;
                  color4 = option == answer ? Colors.green : Colors.red;

                  userPickedAnswer(answer);
//                  if (question == questionBank[_scoreCounter]['answer']) {
//                    _scoreCounter ++;
//                  }
                });
              }
            },
            child: Text(option),
            color: choice == true ? color4 : Colors.grey,
            splashColor: Colors.tealAccent.shade100,
            ),
          ),
        );
    }
}


