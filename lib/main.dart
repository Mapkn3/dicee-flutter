import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNumber = Random().nextInt(6) + 1;
  var rightDiceNumber = Random().nextInt(6) + 1;

  void changeDiceFace() {
    int n = Random().nextInt(6) + 15;
    Stream.periodic(Duration(milliseconds: 150))
        .take(n)
        .forEach((_) => setState(() {
              leftDiceNumber = Random().nextInt(6) + 1;
              rightDiceNumber = Random().nextInt(6) + 1;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: changeDiceFace,
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: changeDiceFace,
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
