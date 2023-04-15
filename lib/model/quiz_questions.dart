class QuizQuestion {
  final String text;
  final List<String> answers;

  const QuizQuestion(this.text, this.answers);

  List<String> shufledAnswers() {
    final shufledList = List.of(answers);
    shufledList.shuffle();
    return shufledList;
  }
}
