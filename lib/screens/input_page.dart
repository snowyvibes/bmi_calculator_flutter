import 'package:bmi_calculator_flutter/calculator_brain.dart';
import 'package:bmi_calculator_flutter/model/bmi.dart';
import 'package:bmi_calculator_flutter/screens/result_page.dart';
import 'package:bmi_calculator_flutter/widgets/icon_content.dart';
import 'package:bmi_calculator_flutter/widgets/pink_button.dart';
import 'package:bmi_calculator_flutter/widgets/resusable_card.dart';
import 'package:bmi_calculator_flutter/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Expanded(
              child: Row(
                children: [
                  ResusableCard(
                      color: maleCardActive
                          ? activeCardsColor
                          : inactiveCardsColor,
                      onTap: () => updateColor(Gender.male),
                      child: const IconContent(
                          text: 'Male', icon: FontAwesomeIcons.mars)),
                  ResusableCard(
                      color: femaleCardActive
                          ? activeCardsColor
                          : inactiveCardsColor,
                      onTap: () => updateColor(Gender.female),
                      child: const IconContent(
                        text: 'Female',
                        icon: FontAwesomeIcons.venus,
                      )),
                ],
              ),
            ),
            ResusableCard(
                child: IconContent(
              text: 'Height',
              columnItem: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toStringAsFixed(0)),
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
            )),
            Expanded(
              child: Row(
                children: [
                  ResusableCard(
                      child: IconContent(
                    text: 'Weight',
                    columnItem: Column(
                      children: [
                        Text(weight.toStringAsFixed(0)),
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
                  )),
                  ResusableCard(
                      child: IconContent(
                    text: 'Age',
                    columnItem: Column(
                      children: [
                        Text(age.toStringAsFixed(0)),
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

                final BMI bmi = calculatorBraian.calculateBMI();

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Result(bmi)));
              },
            )
          ]),
        ),
      ),
    );
  }
}
