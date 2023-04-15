import 'package:flutter/material.dart';

class ItemNumber extends StatelessWidget {
  final bool isCorrect;
  final int questionIndex;
  const ItemNumber(
      {super.key, required this.isCorrect, required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    final number = questionIndex + 1;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: CircleAvatar(
        backgroundColor: isCorrect
            ? const Color.fromARGB(255, 127, 255, 131)
            : const Color.fromARGB(255, 235, 107, 135),
        child: Text(
          number.toString(),
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 20),
        ),
      ),
    );
  }
}
