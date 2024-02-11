import 'package:bmi_calculator_flutter/constants.dart';
import 'package:flutter/material.dart';

class PinkButton extends StatelessWidget {
  const PinkButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: bottomContanierHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom().copyWith(
          backgroundColor: MaterialStateProperty.all(accentColor),
        ),
        onPressed: onPressed,
        child: Text(text.toUpperCase()),
      ),
    );
  }
}
