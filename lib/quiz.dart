import 'package:basics_quiz_app/data/questions.dart';
import 'package:basics_quiz_app/sections/questions_page.dart';
import 'package:basics_quiz_app/sections/result_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;
  bool? backKey;

  @override
  void initState() {
    activeScreen = HomePage(switchScreen);
    super.initState();
  }

  void resetQuiz() {
    setState(() {
      selectedAnswers = [];
      backKey = false;
      activeScreen = HomePage(switchScreen);
    });
  }

  void choosenAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(
          reset: resetQuiz,
          answerList: selectedAnswers,
        );
      });
    }
  }

  void switchScreen() {
    setState(() {
      backKey = true;
      activeScreen = QuizPage(
        onSelectedAnswer: choosenAnswer,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Quiz',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome'),
          actions: [
            if (backKey == true)
              IconButton(
                onPressed: resetQuiz,
                icon: const Icon(Icons.restart_alt),
                tooltip: 'Reset Quiz',
              )
            else
              const SizedBox()
          ],
        ),
        body: activeScreen,
        backgroundColor: const Color.fromARGB(255, 99, 4, 107),
      ),
    );
  }
}
