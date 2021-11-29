import 'package:bmi_calculator/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '/constants.dart';

class Result extends StatelessWidget {
  const Result(
      {Key? key,
      required this.result,
      required this.interpretation,
      required this.state})
      : super(key: key);

  final String result;
  final String interpretation;
  final String state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
                    alignment: Alignment.bottomLeft,
                    child: const Text('Your Result'))),
            ResusableCard(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        state,
                        style: TextStyle(
                            color:
                                state == 'Normal' ? Colors.green : Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      FittedBox(
                        child: Text(result,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 100)),
                      ),
                      const Text(
                        'Normal BMI Range:\n 18.5-25',
                        textAlign: TextAlign.center,
                      ),
                      Text(interpretation, textAlign: TextAlign.center),
                      PinkButton(
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
