enum QuizQuestion {
  math('What is 2 + 2?', ['3', '4', '5'], '4'),
  capital('What is the capital of France?', [
    'Paris',
    'London',
    'Berlin',
  ], 'Paris'),
  flutter('Flutter is developed by?', [
    'Microsoft',
    'Google',
    'Apple',
  ], 'Google');

  final String question;
  final List<String> options;
  final String answer;

  const QuizQuestion(this.question, this.options, this.answer);
}
