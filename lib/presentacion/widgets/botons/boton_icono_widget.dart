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
    this.iconColor = Colors.white12, // Color predeterminado para el ícono
    this.buttonColor = Colors.white, // Color predeterminado para el botón
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          side: BorderSide(color: textColor)),
    );
  }
}
