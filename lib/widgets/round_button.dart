import 'package:flutter/material.dart';

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
      fillColor: const Color(0xFF4C4F5E),
      shape: const CircleBorder(),
      child: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
