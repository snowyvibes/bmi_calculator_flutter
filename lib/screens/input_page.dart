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

  double defaultSliderVal = 170;

  bool maleCardActive = true;
  bool femaleCardActive = false;

  double sliderVal = 170;
  int age = 20;
  double weight = 50;

  double get heightInMeters {
    return sliderVal / 100;
  }

  double get height {
    return heightInMeters * heightInMeters;
  }

  double bmi() {
    final double bmi = weight / height;
    return bmi;
  }

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
                children: [
                  Text(sliderVal.toStringAsFixed(0), style: headline4),
                  const Text('cm')
                ],
              ),
              Slider(
                  activeColor: accentColor,
                  value: sliderVal,
                  min: 20,
                  max: 300,
                  onChanged: (val) {
                    setState(() {
                      sliderVal = val;
                    });
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
                        Button(
                            icon: Icons.add,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            }),
                        const SizedBox(
                          width: 10,
                        ),
                        Button(
                            icon: Icons.remove,
                            onPressed: () {
                              if (weight != 0) {
                                setState(() {
                                  weight--;
                                });
                              }
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
                        Button(
                            icon: Icons.add,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            }),
                        const SizedBox(
                          width: 10,
                        ),
                        Button(
                            icon: Icons.remove,
                            onPressed: () {
                              if (age != 0) {
                                setState(() {
                                  age--;
                                });
                              }
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
        CalculateButton(
          text: 'Calculate',
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Result(
                          result: bmi(),
                        )));
          },
        )
      ]),
    );
  }
}
