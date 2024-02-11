import 'package:bmi_calculator_flutter/model/bmi.dart';
import 'package:bmi_calculator_flutter/widgets/pink_button.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(this.bmi, {Key? key}) : super(key: key);

  final BMI bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    bmi.state.toUpperCase(),
                    style: TextStyle(
                        color:
                            bmi.state == 'Normal' ? Colors.green : Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  FittedBox(
                    child: Text(
                      bmi.value.toStringAsFixed(1),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 100,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Normal BMI Range:\n 18.5-25',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(bmi.interpretation, textAlign: TextAlign.center),
                  const SizedBox(
                    height: 20,
                  ),
                  PinkButton(
                    onPressed: () => Navigator.pop(context),
                    text: 'Recalculate',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
