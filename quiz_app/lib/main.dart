import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black26,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Quizz(),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Quizz extends StatefulWidget {
  @override
  _QuizzState createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  List<Icon> scoreKeeper = [];
  int score = 0;

  void restartGame(){
    setState(() {
      scoreKeeper.clear();
      score = 0;
      quizBrain.resetQuestionNumber();
    });
  }

  void checkAnswer(bool selectedAnswer) {
    setState(() {
      if (quizBrain.isEndOfQuiz()) {
        showDialog(context: context, builder: (_) => AssetGiffyDialog(
          image: Image.asset('assets/gameover.gif', fit: BoxFit.fill),
          title: Text('GAME OVER!',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24.0, fontWeight: FontWeight.w600),
          ),
          buttonOkText: Text('RESTART', style: TextStyle(fontSize: 14.0, color: Colors.white)),
          buttonCancelText: Text('CANCEL', style: TextStyle(fontSize: 14.0, color: Colors.white)),
          description: Text(
            'This is the end of the game! You\'ve got a score of $score. \n Do you want to restart?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
          entryAnimation: EntryAnimation.TOP_LEFT,
          onOkButtonPressed: () {
            restartGame();
            Navigator.pop(context);
          },
        ) );
      } else {
        if (quizBrain.getQuestionAnswer() == selectedAnswer) {
          score++;
          scoreKeeper.add(Icon(Icons.check, color: Colors.green));
        } else {
          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
        }
        quizBrain.nextQuestion();
      }
    });
  }
  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  // ];
  // List<bool> answers = [
  //   false, true, true
  // ];
  // Question q1 = Question(questionText: 'You can lead a cow down stairs but not up stairs.', questionAnswer: false);

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green[400],
              child: Text(
                'TRUE',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 2.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              onPressed: () {
                checkAnswer(false);
              },
              color: Colors.red[600],
              child: Text(
                'FALSE',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: 2.0,
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: scoreKeeper,
        ),
      ],
    );
  }
}
