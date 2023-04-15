import 'package:basics_quiz_app/data/questions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:google_fonts/google_fonts.dart';

import 'Result Section/result_summary.dart';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  void Function() reset;
  final List<String> answerList;

  ResultScreen({super.key, required this.reset, required this.answerList});

  List<Map<String, Object>> getResultData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < answerList.length; i++) {
      summary.add(
        {
          'question-index': i,
          'question': questions[i].text,
          'correct-answer': questions[i].answers[0],
          'selected-answer': answerList[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getResultData();
    final numCorrectAnswer = summaryData.where((element) {
      return element['selected-answer'] == element['correct-answer'];
    }).length;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              '${'You answered $numCorrectAnswer out of ${questions.length}'} Questions correctly!',
              style: GoogleFonts.lato(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 233, 173, 243)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ResultSummary(
              summaryData: summaryData,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
                onPressed: reset,
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ).animate(effects: [
                  RotateEffect(
                      duration: 10.minutes, curve: Curves.ease, end: 10)
                ]),
                label: Text(
                  'Reset Quiz',
                  style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 233, 173, 243)),
                )),
          ],
        ),
      ),
    );
  }
}
