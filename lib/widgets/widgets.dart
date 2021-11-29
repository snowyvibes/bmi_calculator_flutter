import '../constants.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Expanded ResusableCard({
  required final Widget child,
  final Color? colour,
  void Function()? onTap,
  int? flex,
}) {
  return Expanded(
      flex: flex ?? 1,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: colour ?? activeCardsColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: child,
        ),
      ));
}

Column iconContent({
  required BuildContext context,
  required final String text,
  final IconData? icon,
  final Widget? columnItem,
}) {
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

class RoundButton extends StatelessWidget {
  const RoundButton({Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6,
      constraints: const BoxConstraints.tightFor(width: 56, height: 56),
      child: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
      fillColor: const Color(0xFF4C4F5E),
      shape: const CircleBorder(),
    );
  }
}

//Calculate Button

class PinkButton extends StatelessWidget {
  const PinkButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
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
