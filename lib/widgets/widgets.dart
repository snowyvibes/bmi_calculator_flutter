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

SizedBox buildOutlineButton({required IconData icon, required Function press}) {
  return SizedBox(
    width: 40,
    height: 32,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom().copyWith(),
      onPressed: () => press(),
      child: Icon(icon),
    ),
  );
}
