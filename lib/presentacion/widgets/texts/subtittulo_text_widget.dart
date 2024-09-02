import 'package:flutter/cupertino.dart';

class SubTituloTextWidget extends StatelessWidget {
  final String text;
  final Color textColor;

  const SubTituloTextWidget(
      {super.key, required this.text, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 20, color: textColor, fontWeight: FontWeight.bold),
    );
  }
}
