import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/colores/app_colors.dart';
import 'package:flutter_application_2/presentacion/widgets/widgets.dart';

class BotonContinuarWiget extends StatelessWidget {
  final VoidCallback onPressed;

  const BotonContinuarWiget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BotonIconoWidget(
        icon: Icons.check_circle_outline_rounded,
        iconColor: AppColors.blancoOscus,
        text: 'Continuar',
        textColor: AppColors.blancoOscus,
        buttonColor: AppColors.verdeOscus,
        onPressed: onPressed);
  }
}
