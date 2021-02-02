import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[700],
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: Center(
            child: Text(
              'Ask me Anything',
            ),
          ),
        ),
        body: MagicBall(),
      ),
    ),
  );
}

class MagicBall extends StatefulWidget {
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  var ballCount = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Expanded(
            child: Container(
              child: FlatButton(
                splashColor: Colors.transparent,
                onPressed: (){
                  setState(() {
                    ballCount = Random().nextInt(5) + 1;
                  });
                },
                child: Image.asset('images/ball$ballCount.png'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
