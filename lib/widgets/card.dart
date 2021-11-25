import '/screens/input_page.dart';
import 'package:flutter/material.dart';

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
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, size: 80),
      const SizedBox(
        height: 10,
      ),
      Text(text.toUpperCase(), style: Theme.of(context).textTheme.bodyText1),
    ],
  );
}
