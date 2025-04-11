import 'dart:io';

void main() {
  print(
    '\n1. Hello World\n2. Variables and Data Types\n3. Conditional Statements\n4. Loops\n5. Functions\n6. Enum and Swtich',
  );

  print("Enter number: ");
  var input = stdin.readLineSync();

  switch (input) {
    case '1':
      basic();
      break;
    case '2':
      DatatypesVariables();
      break;
    case '3':
      Conditional();
      break;
    case '4':
      Loops();
      break;
    case '5':
      netSalary();
      break;
    case '6':
      EnumSwitch();
      break;
    default:
  }
}

void basic() {
  print('\nBasic');
  print('Hello, World!');

  gotoMain();
}

void DatatypesVariables() {
  print('\nVariables and Data Types');
  //integer
  int age = 90;
  print('Your age is $age');
  //string
  String statement = 'This is a statement';
  print(statement);
  //double
  double price = 19.99;
  print('Banana: \$$price');
  //map
  Map<String, String> cakes = {
    'choco': 'Chocolate Cake',
    'carrot': 'Carrot Cupcake',
  };
  print("Pastry: ${cakes}");
  print("Keys: ${cakes.keys}");
  print("Values: ${cakes.values}");

  gotoMain();

  // print("Pastry: ${cakes.toString()}");
  // final
  //const
  //static
  //late
  //dynamic
}

void Conditional() {
  // 7 neutral
  // <7 acidic
  // >7 basic
  print('\nConditional');
  stdout.write("Enter ph Value: ");
  String? value = stdin.readLineSync();

  if (value != null && value.isNotEmpty) {
    var phValue = int.parse(value);
    if (phValue > 7) {
      print('$phValue is basic');
    } else if (phValue < 7) {
      print('$value is acidic');
    } else
      print('$phValue is neutral');
  }

  gotoMain();
}

void Loops() {
  print('\nLoops');
  var stock = {
    'Apple': 50,
    'Banana': 8,
    'Orange': 15,
    'Mango': 3,
    'Grapes': 20,
  };

  for (var item in stock.entries) {
    if (item.value >= 20) {
      print('${item.key} - Stock is sufficient (${item.value} items)');
    } else if (item.value < 20) {
      print(
        'Restock Alert:${item.key} Low stock (Only ${item.value} items left)',
      );
    }
  }

  gotoMain();
}

void netSalary() {
  print('\nFunctions');
  stdout.write("Enter Base Salary: ");
  String? salary = stdin.readLineSync();
  double Salary = double.parse(salary ?? '');

  stdout.write("Enter bonus: ");
  String? bonus = stdin.readLineSync();
  double Bonus = double.parse(bonus ?? '');

  stdout.write("Enter deduction if any: ");
  String? deduction = stdin.readLineSync();
  double Deduction = double.parse(deduction ?? '');

  double grossSalary = grossSalaryCompute(Salary, Bonus);
  double netSalary = netSalaryCompute(grossSalary, Deduction);

  print("Gross Salary = ${grossSalary.toString()}");
  print("Net Salary = ${netSalary.toString()}");

  gotoMain();
}

double grossSalaryCompute(double a, double b) {
  return a + b;
}

double netSalaryCompute(double a, double b) {
  return a - b;
}

enum Days { Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday }

void EnumSwitch() {
  print('\nEnum and Switch');
  Days today = Days.Saturday;
  switch (today) {
    case Days.Sunday:
      print('🌍');
      break;
    case Days.Monday:
      print('Monday is \u{1f4a9}');
      break;
    case Days.Tuesday:
      print('Tuesday is \u{1f921}');
      break;
    case Days.Wednesday:
      print('Wednesday is \u{1f47b}');
      break;
    case Days.Thursday:
      print('Thursday is \u{1f92e}');
      break;
    case Days.Friday:
      print('Friday is \u{1f649}');
      break;
    case Days.Saturday:
      print('Saturday is \u{1f647}');
      break;
  }

  gotoMain();
}

void gotoMain() {
  stdout.write('\nMain?');
  var input = stdin.readLineSync();

  if (input == 'y') {
    main();
  }
}
