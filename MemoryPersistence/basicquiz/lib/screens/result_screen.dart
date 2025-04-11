import 'package:basicquiz/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

// ignore: must_be_immutable
class ResultScreen extends StatefulWidget {
  final int score;
  final VoidCallback onReset;
  const ResultScreen({super.key, required this.score, required this.onReset});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final memory = GetStorage();

  void goToFinishScreen() {
    memory.write('screen', 'finish');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder:
            (context) =>
                ResultScreen(score: widget.score, onReset: widget.onReset),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Color.fromARGB(255, 69, 6, 73)),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/trophy.png', scale: 1.5),

              Text(
                'You got ${widget.score} pts!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Divider(height: 100, color: const Color.fromARGB(0, 100, 64, 64)),
              ButtonComp(
                label: 'Finish',
                onPressed: () {
                  widget.onReset();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonComp extends StatefulWidget {
  final String? label;
  final VoidCallback onPressed;
  const ButtonComp({super.key, required this.label, required this.onPressed});

  @override
  State<ButtonComp> createState() => _ButtonCompState();
}

class _ButtonCompState extends State<ButtonComp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 25, right: 25),
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffFFB200),
          elevation: 10.0,
        ),
        child: Text(
          widget.label!,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}
