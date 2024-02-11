import 'package:bmi_calculator_flutter/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    super.key,
    required this.text,
    this.icon,
    this.columnItem,
  });

  final String text;
  final IconData? icon;
  final Widget? columnItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon == null ? const SizedBox() : Icon(icon, size: 80),
        kSizedBox,
        Text(text.toUpperCase(), style: kLabelTextStyle),
        kSizedBox,
        columnItem ?? const SizedBox(),
      ],
    );
  }
}
