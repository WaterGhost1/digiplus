import 'package:get_storage/get_storage.dart';
import 'package:basicquiz/data/my_data.dart';

class QuizController {
  final memory = GetStorage();
  int score = 0;
  int? selectedIndex;
  String? selectedOption;
  int currentQuestionIndex = 0;
  final List<QuizQuestion> allQuestions = QuizQuestion.values;

  QuizController() {
    // Initialize values from storage
    selectedIndex = memory.read('selectedIndex');
    score = memory.read('score') ?? 0;
    currentQuestionIndex = memory.read('currentQuestionIndex') ?? 0;
  }

  void selectOption(int index) {
    selectedIndex = index;
    selectedOption = allQuestions[currentQuestionIndex].options[index];

    memory.write('selectedIndex', index);
    memory.write('currentQuestionIndex', currentQuestionIndex);
  }

  void submitAnswer(Function updateUI, Function navigateToResult) {
    if (selectedOption == allQuestions[currentQuestionIndex].answer) {
      score++;
      memory.write('score', score);
    }

    if (currentQuestionIndex < allQuestions.length - 1) {
      currentQuestionIndex++;
      selectedIndex = null;
      selectedOption = null;
      memory.write('currentQuestionIndex', currentQuestionIndex);

      updateUI(); // Call UI update function
    } else {
      navigateToResult(); // Navigate to result screen
    }
  }

  void reset(Function updateUI) {
    memory.erase();
    score = 0;
    currentQuestionIndex = 0;
    selectedIndex = null;
    selectedOption = null;

    updateUI(); // Refresh UI after reset
  }
}
