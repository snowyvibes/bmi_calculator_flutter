import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/screens/result_page.dart';

import '../constants.dart';
import '../widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  void updateColor(Gender gender) {
    gender == Gender.male
        ? setState(() {
            maleCardActive = true;
            femaleCardActive = false;
          })
        : setState(() {
            maleCardActive = false;
            femaleCardActive = true;
          });
  }

  bool maleCardActive = true;
  bool femaleCardActive = false;

  int height = 170;
  int age = 20;
  int weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(children: [
        Expanded(
          child: Row(
            children: [
              ResusableCard(
                  colour:
                      maleCardActive ? activeCardsColor : inactiveCardsColor,
                  onTap: () => updateColor(Gender.male),
                  child: iconContent(
                      context: context,
                      text: 'Male',
                      icon: FontAwesomeIcons.mars)),
              ResusableCard(
                  colour:
                      femaleCardActive ? activeCardsColor : inactiveCardsColor,
                  onTap: () => updateColor(Gender.female),
                  child: iconContent(
                    context: context,
                    text: 'Female',
                    icon: FontAwesomeIcons.venus,
                  )),
            ],
          ),
        ),
        ResusableCard(
            child: iconContent(
          columnItem: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(height.toStringAsFixed(0), style: headline4),
                  const Text(
                    'cm',
                    style: kLabelTextStyle,
                  )
                ],
              ),
              Slider(
                  activeColor: accentColor,
                  value: height.toDouble(),
                  min: 20,
                  max: 300,
                  onChanged: (val) {
                    setState(() => height = val.toInt());
                  }),
            ],
          ),
          context: context,
          text: 'Height',
        )),
        Expanded(
          child: Row(
            children: [
              ResusableCard(
                  child: iconContent(
                columnItem: Column(
                  children: [
                    Text(weight.toStringAsFixed(0), style: headline4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundButton(
                            icon: Icons.add,
                            onPressed: () => setState(() => weight++)),
                        const SizedBox(
                          width: 10,
                        ),
                        RoundButton(
                            icon: Icons.remove,
                            onPressed: () {
                              if (weight != 0) setState(() => weight--);
                            }),
                      ],
                    ),
                  ],
                ),
                context: context,
                text: 'Weight',
              )),
              ResusableCard(
                  child: iconContent(
                columnItem: Column(
                  children: [
                    Text(age.toStringAsFixed(0), style: headline4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        RoundButton(
                            icon: Icons.add,
                            onPressed: () => setState(() => age++)),
                        const SizedBox(
                          width: 10,
                        ),
                        RoundButton(
                            icon: Icons.remove,
                            onPressed: () {
                              if (age != 0) setState(() => age--);
                            }),
                      ],
                    ),
                  ],
                ),
                context: context,
                text: 'Age',
              )),
            ],
          ),
        ),
        kSizedBox,
        PinkButton(
          text: 'Calculate',
          onPressed: () {
            CalculatorBrain calculatorBraian =
                CalculatorBrain(height: height, weight: weight);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Result(
                          result: calculatorBraian.calculateBMI,
                          interpretation: calculatorBraian.interpretation(),
                          state: calculatorBraian.stateText(),
                        )));
          },
        )
      ]),
    );
  }
}
