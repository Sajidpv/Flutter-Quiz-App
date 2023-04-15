import 'package:basics_quiz_app/widgets/result_item_number.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ItemSummary extends StatelessWidget {
  final Map<String, Object> itemData;
  const ItemSummary({required this.itemData, super.key});

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['correct-answer'] == itemData['selected-answer'];
    return Row(
      children: [
        ItemNumber(
            isCorrect: isCorrectAnswer,
            questionIndex: itemData['question-index'] as int),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'].toString(),
                style: GoogleFonts.lato(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 233, 173, 243)),
              ),
              Text(
                'Answer : ${itemData['correct-answer']}',
                style: GoogleFonts.lato(
                    fontSize: 15, color: const Color.fromARGB(255, 3, 202, 69)),
              ),
              Text(
                'Your Answer : ${itemData['selected-answer']}',
                style: GoogleFonts.lato(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 30, 123, 211)),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
