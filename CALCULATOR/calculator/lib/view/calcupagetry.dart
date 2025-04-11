import 'package:calculator/data/btn_values.dart';
// import 'package:calculator/state/calculator_functions.dart';
import 'package:flutter/material.dart';

class CalculatorPageTry extends StatefulWidget {
  const CalculatorPageTry({super.key});

  @override
  State<CalculatorPageTry> createState() => _CalculatorPageTryState();
}

class _CalculatorPageTryState extends State<CalculatorPageTry> {
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
                    : ('$expression' == 'Infinity'
                        ? 'Undefined'
                        : '$expression'), // '$num1$operand$num2'.isEmpty ? '0' : '$num1$operand$num2',
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
    if (value == Btn.holder) {
      showSnackBar();
      return;
    }

    setState(() {
      expression += value;
    });
  }

  void clear(String value) {
    if (expression.isNotEmpty) {
      expression = expression.substring(0, expression.length - 1);
    } else {
      expression = "0";
    }

    setState(() {});
  }

  void allclear() {
    setState(() {
      expression = "";
    });
  }

  void convertpercent() {
    (expression.isEmpty) ? "0" : calculate();
    final convert = double.parse(expression);
    setState(() {
      expression = '${(convert / 100)}';
    });
  }

  void calculate() {
    try {
      List<String> tokens = _tokenizeExpression(
        expression,
      ); // Tokenize the input
      double result = _evaluateTokens(tokens); // Evaluate the tokens

      setState(() {
        expression = result.toString();
        // print('expression in tokenize: $expression'); // Display the result
        if (expression.endsWith('.0')) {
          expression = expression.substring(
            0,
            expression.length - 2,
          ); // Remove ".0" for integers
        }
      });
    } catch (e) {
      setState(() {
        expression = 'Error'; // Handle invalid expressions
      });
    }
  }

  List<String> _tokenizeExpression(String exp) {
    List<String> tokens = [];
    String currentNumber = '';
    for (int i = 0; i < exp.length; i++) {
      String char = exp[i];
      if ('0123456789.'.contains(char)) {
        // If the character is a digit or a decimal point, build the number
        currentNumber += char;
      } else {
        if (currentNumber.isNotEmpty) {
          tokens.add(currentNumber);
          currentNumber = '';
        }
        tokens.add(char);
      }
    }
    if (currentNumber.isNotEmpty) {
      tokens.add(currentNumber);
    }

    print('tokens: $tokens');

    return tokens;
  }

  double _evaluateTokens(List<String> tokens) {
    if ('+-.'.contains(tokens[0])) {
      tokens.insert(0, "0");
    }
    double result = double.parse(tokens[0]);

    for (int i = 1; i < tokens.length; i += 2) {
      String operator = tokens[i];
      double number = double.parse(tokens[i + 1]);

      if (operator == '+') {
        result += number;
      } else if (operator == '-') {
        result -= number;
      } else if (operator == 'x') {
        result *= number;
      } else if (operator == '÷') {
        result /= number;
      }
    }
    print('result: $result');
    return result;
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
          onTap: () {
            onBtnTap(value);
          },
          child: Center(child: buttonContent(value)),
        ),
      ),
    );
  }

  showSnackBar() {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Stack(
          children: [
            Center(child: Image.asset('assets/images/snorlax.png')),
            Center(
              child: Text(
                'SNORLAX RAWR',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        duration: Duration(seconds: 1),
        backgroundColor: Color(0xfffcbacb),
      ),
    );
  }
}

buttonContent(value) {
  if (value == Btn.holder) {
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: Image.asset('assets/images/calcu_image.png'),
    );
  } else {
    return Text(
      value,
      style: TextStyle(
        color: Colors.white,
        fontSize: 35,
        // fontWeight: FontWeight.bold,
      ),
    );
  }
}
