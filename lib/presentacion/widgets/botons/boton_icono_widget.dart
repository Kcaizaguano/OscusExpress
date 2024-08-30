import 'package:flutter/material.dart';

class BotonIconoWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPressed;

  const BotonIconoWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.textColor,
    this.iconColor = Colors.white12,
    this.buttonColor = Colors.white,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: iconColor,
        size: 24,
      ),
      label: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
        ),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          side: BorderSide(color: textColor),
          //fixedSize: const Size(200, 70),
          elevation: 15),
    );
  }
}
