import '/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double bottomContanierHeight = 70;

const Color activeCardsColor = Color(0xFF1D1E33);

const Color inactiveCardsColor = Color(0xFF111328);

enum Gender {
  male,
  female,
}

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

  bool maleCardActive = false;
  bool femaleCardActive = false;

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
                  onTap: () {
                    updateColor(Gender.male);
                  },
                  child: iconContent(
                      context: context,
                      text: 'Male',
                      icon: FontAwesomeIcons.mars)),
              ResusableCard(
                  colour:
                      femaleCardActive ? activeCardsColor : inactiveCardsColor,
                  onTap: () {
                    updateColor(Gender.female);
                  },
                  child: iconContent(
                      context: context,
                      text: 'Female',
                      icon: FontAwesomeIcons.venus)),
            ],
          ),
        ),
        ResusableCard(
            child: iconContent(
          context: context,
          text: 'Height',
        )),
        Expanded(
          child: Row(
            children: [
              ResusableCard(
                  child: iconContent(
                context: context,
                text: 'Weight',
              )),
              ResusableCard(
                  child: iconContent(
                context: context,
                text: 'Age',
              )),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          height: bottomContanierHeight,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom().copyWith(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xFFEB1555)),
            ),
            onPressed: () {},
            child: Text('Calculate'.toUpperCase()),
          ),
        )
      ]),
    );
  }
}
