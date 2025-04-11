
//   import 'package:calculator/data/btn_values.dart';

// void calculate(
//   String input, String result,
//     // List<String> operand = [Btn.subtract, Btn.add, Btn.multiply, Btn.divide ]
//   ) {
    
//     final double input = double.parse(input);
//     // final double number2 = double.parse(num2);
//     var result = 0.0;

//     switch (input) {
//       case '+':
//         result = number1 + number2;
//         break;
//       case '-':
//         result = number1 - number2;
//         break;
//       case 'x':
//         result = number1 * number2;
//         break;
//       case '/':
//         result = number1 / number2;
//         break;
//       default:
//     }

//     setState(() {
//       num1 = '$result';

//       if (num1.endsWith('.0')) {
//         num1 = num1.substring(0, num1.length - 2);
//       }

//       operand = '';
//       num2 = '';
//     });
//   }