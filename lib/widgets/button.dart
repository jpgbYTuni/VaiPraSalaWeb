import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final double buttonWidth;
  final double buttonHeight;
  final Future<void> Function()? onPressed;
  final Color buttonColor;

  const Button({
    Key? key,
    required this.text,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.onPressed,
    required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed != null ? () => onPressed!() : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
