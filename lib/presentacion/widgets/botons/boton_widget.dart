import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentacion/widgets/texts/text_widget.dart';

class BotonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  const BotonWidget({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color, // Color de fondo
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 20),
          onPressed: onPressed,
          child: TextWidget(text: text, textColor: textColor, size: 16)),
    );
  }
}
