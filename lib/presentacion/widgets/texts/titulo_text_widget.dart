import 'package:flutter/cupertino.dart';

class TituloTextWidget extends StatelessWidget {
  final String text;
  final Color textColor;

  const TituloTextWidget(
      {super.key, required this.text, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 40, color: textColor, fontWeight: FontWeight.bold),
    );
  }
}
