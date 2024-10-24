import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    bool isCorrect = itemData["isCorrect"] as bool;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          itemData["questionIndex"] as int,
          isCorrect,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData["question"] as String,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                itemData["userAnswer"] as String,
                style: TextStyle(color: isCorrect ? Colors.green : Colors.red),
              ),
              Text(
                itemData["correctAnswer"] as String,
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        )
      ],
    );
  }
}
