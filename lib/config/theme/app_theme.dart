import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/colores/app_colors.dart';

const Color azulOscus = Color(0xFF194996);
const Color verdeOscus = Color(0xFFb0c506);
const Color blancoOscus = Color(0xFFffffff);
const Color grisoscus1 = Color(0xFFededed);
const Color grisoscus2 = Color(0xFFdadada);
const Color grisoscus3 = Color(0xFFc6c6c6);
const Color grisoscus4 = Color(0xFF878787);

const List<Color> _colorThemes = [
  azulOscus,
  verdeOscus,
  blancoOscus,
  grisoscus1,
  grisoscus2,
  grisoscus3,
  grisoscus4
];

class AppTheme {
  ThemeData theme() {
    return ThemeData.from(
      //fontFamily: 'Montserrat',
      useMaterial3: true,
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue, backgroundColor: AppColors.blancoOscus),
    );
  }
}
