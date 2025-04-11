import 'package:calculator/data/btn_values.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String num1 = '';
  String operand = '';
  String num2 = '';
  String expression = '';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      bottom: true,
      child: Scaffold(
        backgroundColor: Colors.black,
        drawer: Drawer(
          child: Column(children: [ListTile(title: Text('Drawer'))]),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.orange),
        ),
        body: Column(
          children: [
            //result
            Container(
              alignment: Alignment.bottomRight,
              width: double.infinity,
              height: 275,
              padding: EdgeInsets.all(10),
              child: Text(
                '$expression'.isEmpty
                    ? '0'
                    : '$expression', // '$num1$operand$num2'.isEmpty ? '0' : '$num1$operand$num2',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.end,
              ),
            ),
            //buttons
            Wrap(
              runSpacing: 0,
              children:
                  Btn.buttonValues
                      .map(
                        (value) => SizedBox(
                          width: screenSize.width / 4,
                          height: 100,
                          child: buttonDesign(value),
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }

  void onBtnTap(String value) {
    if (value == Btn.signs) {
      clear(value);
      return;
    }

    if (value == Btn.allclear) {
      allclear();
      return;
    }
    if (value == Btn.equal) {
      calculate();
      return;
    }

    if (value == Btn.percent) {
      convertpercent();
      return;
    }

    append(value);
  }

  void append(String value) {
    if (value != Btn.dot && int.tryParse(value) == null) {
      if (operand.isNotEmpty && num2.isNotEmpty) {}
      operand = value;
    } else if (num1.isEmpty || operand.isEmpty) {
      if (value == Btn.dot && num1.contains(Btn.dot)) {
        return;
      }
      if (value == Btn.dot && (num1.isEmpty || num1 == Btn.dot)) {
        value = '0.';
      }
      num1 += value;
    } else {
      if (value == Btn.dot && num2.contains(Btn.dot)) {
        return;
      }
      if (value == Btn.dot && (num2.isEmpty || num2 == Btn.dot)) {
        value = '0.';
      }
      num2 += value;
    }
    setState(() {});
  }

  void clear(String value) {
    if (num2.isNotEmpty) {
      num2 = num2.substring(0, num2.length - 1);
    } else if (operand.isNotEmpty) {
      operand = '';
    } else if (num1.isNotEmpty) {
      num1 = num1.substring(0, num1.length - 1);
    }

    setState(() {});
  }

  void allclear() {
    setState(() {
      num1 = "";
      operand = "";
      num2 = "";
    });
  }

  void convertpercent() {
    if (num1.isNotEmpty && operand.isNotEmpty && num2.isNotEmpty) {
      calculate();
    }

    if (operand.isNotEmpty) return;

    final number = double.parse(num1);
    setState(() {
      num1 = '${(number / 100)}';
      operand = '';
      num2 = '';
    });
  }

  void calculate() {
    if (num1.isEmpty) return;
    if (operand.isEmpty) return;
    if (num2.isEmpty) return;

    final double number1 = double.parse(num1);
    final double number2 = double.parse(num2);
    var result = 0.0;

    switch (operand) {
      case Btn.add:
        result = number1 + number2;
        break;
      case Btn.subtract:
        result = number1 - number2;
        break;
      case Btn.multiply:
        result = number1 * number2;
        break;
      case Btn.divide:
        result = number1 / number2;
        break;
      default:
    }

    setState(() {
      num1 = '$result';

      if (num1.endsWith('.0')) {
        num1 = num1.substring(0, num1.length - 2);
      }

      operand = '';
      num2 = '';
    });
  }

  Widget buttonDesign(String value) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color:
            [
                  Btn.divide,
                  Btn.add,
                  Btn.multiply,
                  Btn.equal,
                  Btn.subtract,
                ].contains(value)
                ? Colors.orange
                : [Btn.allclear, Btn.signs, Btn.percent].contains(value)
                ? Color(0xff6a6a6a)
                : Color(0xff3f3f3f),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        child: InkWell(
          onTap: () => onBtnTap(value),
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
