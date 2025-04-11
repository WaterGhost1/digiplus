import 'package:basicquiz/components/cards.dart';
import 'package:basicquiz/data/my_data.dart';
import 'package:basicquiz/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final memory = GetStorage();
  int score = 0;
  int? selectedIndex;
  String? selectedOption;

  int currentQuestionIndex = 0;
  final List<QuizQuestion> allQuestions = QuizQuestion.values;

  @override
  void initState() {
    super.initState();
    selectedIndex = memory.read('selectedIndex');
    score = memory.read('score') ?? 0;
    currentQuestionIndex = memory.read('currentQuestionIndex') ?? 0;
  }

  void selectOption(int index) {
    setState(() {
      selectedIndex = index;
      selectedOption = allQuestions[currentQuestionIndex].options[index];

      memory.write('selectedIndex', index);
      memory.write('currentQuestionIndex', currentQuestionIndex);
    });
  }

  void submitAnswer() {
    if (selectedOption == allQuestions[currentQuestionIndex].answer) {
      setState(() {
        score++;
        memory.write('score', score);
      });
    } else {
      score = score;
      memory.write('score', score);
    }
    setState(() {
      if (currentQuestionIndex < allQuestions.length - 1) {
        currentQuestionIndex++;
        selectedIndex = null; // Reset selection for next question
        selectedOption = null;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(score: score, onReset: reset),
          ),
        );
      }
    });
  }

  void reset() {
    memory.erase();
    //go back to first question
    setState(() {
      currentQuestionIndex++;
      selectedIndex = null; // Reset selection for next question
      selectedOption = null;
      score = 0; // Reset score
      currentQuestionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Quiz Game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //score
            QuesTracker(
              currentIndex: currentQuestionIndex.toInt() + 1,
              numOfQues: allQuestions.length,
            ),
            Divider(height: 20, color: Colors.transparent),

            //question : can i get the key ?? math, capital, flutter
            QuestionCard(question: allQuestions[currentQuestionIndex].question),
            Divider(height: 30, color: Colors.transparent),

            //options
            ListView.builder(
              shrinkWrap: true,
              itemCount: allQuestions[currentQuestionIndex].options.length,
              itemBuilder: (context, index) {
                return ChoiceCard(
                  options: allQuestions[currentQuestionIndex].options[index],
                  index: index,
                  isSelected: selectedIndex == index,
                  onTap: () => selectOption(index),
                );
              },
            ),
            Divider(height: 50, color: Colors.transparent),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: submitAnswer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff88304E),
                  ),
                  child: Text('Submit'),
                ),
                ElevatedButton(
                  onPressed: reset,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff88304E),
                  ),
                  child: Text('Reset'),
                ),
                Text('Score: $score'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
