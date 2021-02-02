import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Xylophone(),
    ),
    debugShowCheckedModeBanner: false,
  ),
  );
}

class Xylophone extends StatefulWidget {
  @override
  _XylophoneState createState() => _XylophoneState();
}

void playKey(int soundNumber) async{
  final player = AudioCache();
  player.play('note$soundNumber.wav');
}

Expanded buildKey({Color color, int soundNumber, String textNote}){
  return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playKey(soundNumber);
        },
        child: Text(textNote, style: TextStyle(fontSize: 18.0, color: Colors.white)),
      ),
  );
}

class _XylophoneState extends State<Xylophone> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            buildKey(color: Colors.red[600], soundNumber: 1, textNote: "C"),
            buildKey(color: Colors.orange[400], soundNumber: 2, textNote: "D"),
            buildKey(color: Colors.yellow[600], soundNumber: 3, textNote: "E"),
            buildKey(color: Colors.green[700], soundNumber: 4, textNote: "F"),
            buildKey(color: Colors.blue[700], soundNumber: 5, textNote: "G"),
            buildKey(color: Colors.indigo, soundNumber: 6, textNote: "A"),
            buildKey(color: Colors.indigo[900], soundNumber: 7, textNote: "B"),
          ],
      ),
    );
  }
}

