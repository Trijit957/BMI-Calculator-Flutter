import 'dart:math';

const Map<String, String> bmiResult = {
  'UN': 'underweight',
  'N': 'normal',
  'OW': 'overweight',
  'O': 'obesity'
};

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final double height;
  final double weight;

  late double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi < 18.5) {
      return bmiResult['UN']!;
    } else if (_bmi >= 18.5 && _bmi < 25) {
      return bmiResult['N']!;
    } else if (_bmi >= 25 && _bmi < 30) {
      return bmiResult['OW']!;
    } else if (_bmi >= 30) {
      return bmiResult['O']!;
    } else {
      return 'Not Defined';
    }
  }

  String getInterpretation() {
    if (_bmi < 18.5) {
      return 'You have a lower than normal body weight. You can eat a bit more!';
    } else if (_bmi >= 18.5 && _bmi < 25) {
      return 'You have a normal body weight. Good job!';
    } else if (_bmi >= 25 && _bmi < 30) {
      return 'You have a higher than normal body weight. Try to exercise more!';
    } else if (_bmi >= 30) {
      return 'You have obesity, kindly start treatment accordingly!';
    } else {
      return 'Not Defined';
    }
  }
}
