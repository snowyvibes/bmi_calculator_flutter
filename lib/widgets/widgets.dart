import '../constants.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Expanded ResusableCard({
  required final Widget child,
  final Color? colour,
  void Function()? onTap,
}) {
  return Expanded(
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
      Text(text.toUpperCase(), style: Theme.of(context).textTheme.bodyText1),
      kSizedBox,
      columnItem ?? const SizedBox(),
    ],
  );
}

class Button extends StatelessWidget {
  const Button({Key? key, required this.onPressed, required this.icon})
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

class CalculateButton extends StatelessWidget {
  const CalculateButton({Key? key, required this.onPressed, required this.text})
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
