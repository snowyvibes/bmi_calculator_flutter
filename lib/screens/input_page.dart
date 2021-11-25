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

  bool maleCardActive = false;
  bool femaleCardActive = false;
  double sliderVal = 170;

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
              Text(sliderVal.toStringAsFixed(0) + ' cm',
                  style: Theme.of(context).textTheme.headline4),
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
                  children: [buildOutlineButton(icon: Icons.add, press: () {})],
                ),
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
        kSizedBox,
        SizedBox(
          width: double.infinity,
          height: bottomContanierHeight,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom().copyWith(
              backgroundColor: MaterialStateProperty.all(accentColor),
            ),
            onPressed: () {},
            child: Text('Calculate'.toUpperCase()),
          ),
        )
      ]),
    );
  }
}
