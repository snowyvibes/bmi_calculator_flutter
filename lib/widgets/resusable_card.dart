import 'package:bmi_calculator_flutter/constants.dart';
import 'package:flutter/material.dart';

class ResusableCard extends StatelessWidget {
  const ResusableCard(
      {super.key, required this.child, this.onTap, this.color, this.flex});

  final Widget child;
  final Color? color;
  final int? flex;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex ?? 1,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color ?? activeCardsColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: child,
          ),
        ));
  }
}
