import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/colores/app_colors.dart';
import 'package:flutter_application_2/config/constantes/environment.dart';

class AppBarLogoOscusWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarLogoOscusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.blancoOscus,
      centerTitle: true, // Centra el título de forma más sencilla
      title: Image.asset(
        Environment.logoOscus,
        height: 40,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
