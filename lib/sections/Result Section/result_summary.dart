import 'package:basics_quiz_app/sections/Result%20Section/item_summary.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultSummary extends StatelessWidget {
  List<Map<String, Object>> summaryData;

  ResultSummary({required this.summaryData, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return ItemSummary(itemData: data);
          }).toList(),
        ),
      ),
    );
  }
}
