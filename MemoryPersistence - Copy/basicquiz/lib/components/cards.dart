import 'package:flutter/material.dart';

class QuesTracker extends StatelessWidget {
  final int currentIndex;
  final int numOfQues;

  const QuesTracker({
    super.key,
    required this.currentIndex,
    required this.numOfQues,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        width: 80,
        height: 50,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            '$currentIndex / $numOfQues',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  final String question;
  const QuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff88304E),
      child: SizedBox(
        width: double.infinity,
        height: 300,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            question,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  final String options;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const ChoiceCard({
    super.key,
    required this.options,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color:
            isSelected ? Color.fromARGB(255, 136, 78, 121) : Color(0xff4F1C51),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            options,
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class Resultcard extends StatelessWidget {
  final String score;
  const Resultcard({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff88304E),
      child: SizedBox(
        width: double.infinity,
        height: 300,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Result: \n $score',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
