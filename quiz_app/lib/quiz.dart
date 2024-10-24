import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  void changeScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void selectedAnswer(String answer) {
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    Widget screenWidget = StartScreen(changeScreen);

    if(activeScreen == "questions-screen"){
      screenWidget = QuestionsScreen(selectedAnswer);
    }else if(activeScreen == "result-screen"){
      screenWidget = ResultScreen(selectedAnswers,changeScreen);
      selectedAnswers = [];
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 42, 3, 108),
              Color.fromARGB(255, 104, 70, 163),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenWidget
        ),
      ),
    );
  }
}
