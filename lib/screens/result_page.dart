import 'package:bmi_calculator/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '/constants.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.result}) : super(key: key);

  final double result;

  Text stateText() {
    if (result < 18.5) {
      return const Text(
        'Low',
        style: TextStyle(color: Colors.red),
      );
    } else if (result > 25) {
      return const Text(
        'High',
        style: TextStyle(color: Colors.red),
      );
    } else {
      return const Text(
        'Normal',
        style: TextStyle(color: Colors.green),
      );
    }
  }

  Text description() {
    if (result < 18.5) {
      return const Text(
        'You are Underweight! You should eat food with more nutrients.',
        textAlign: TextAlign.center,
      );
    } else if (result > 25) {
      return const Text(
        'You are Overweight! Control your diet and do more excercise.',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You\'re Healthy. Good Job!',
        textAlign: TextAlign.center,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Your Result'),
            ResusableCard(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  stateText(),
                  FittedBox(
                    child: Text(result.toStringAsFixed(1),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 100)),
                  ),
                  kSizedBox,
                  const Expanded(
                    child: Text(
                      'Normal BMI Range:\n 18.5-25',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(child: description()),
                  CalculateButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: 'Recalculate',
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
