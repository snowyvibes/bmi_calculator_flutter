import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int weight;
  final int height;

  double? get _bmi {
    return weight / pow(height / 100, 2);
  }

  String get calculateBMI {
    return _bmi!.toStringAsFixed(1);
  }

  String stateText() {
    if (_bmi! < 18.5) {
      return 'Underweight';
    } else if (_bmi! > 25) {
      return 'Overweight';
    } else {
      return 'Normal';
    }
  }

  String interpretation() {
    if (_bmi! < 18.5) {
      return 'You have a lower BMI than normal body rate. You can eat a bit more.';
    } else if (_bmi! > 25) {
      return 'You have a higher BMI than normal body rate. Try to exercise more.';
    } else {
      return 'You have a normal body weight. Good Job!';
    }
  }
}
