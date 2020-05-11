import 'package:flutter/material.dart';
import 'quiz.dart';

class Summary extends StatefulWidget {
  final scoreCounter;
  Summary(this.scoreCounter);

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade800,
        appBar: AppBar(
          title: Text(
              'Summary page',
            style: TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey.shade800,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 150.0, horizontal: 100.0 ),
            child: Column(
              children: <Widget>[
                Text(
                    'You scored',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              Text(
                    score(),
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  score(){
    return widget.scoreCounter.toString();
  }
}
