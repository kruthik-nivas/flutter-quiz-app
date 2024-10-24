import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.selectedAnswers, this.resetQuiz, {super.key});
  final List<String> selectedAnswers;

  final void Function() resetQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        "questionIndex": i,
        "question": questions[i].text,
        "correctAnswer": questions[i].answers[0],
        "userAnswer": selectedAnswers[i],
        "isCorrect": questions[i].answers[0] == selectedAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestionsAnswered = questions.length;
    final questionsCorrectlyAnswered = summaryData.where((data) {
      return data["userAnswer"].toString() == data["correctAnswer"].toString();
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You answered $questionsCorrectlyAnswered out of $totalQuestionsAnswered questions right!",
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionsSummary(summaryData),
          TextButton(
              onPressed: resetQuiz,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.restart_alt,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Restart Quiz",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
