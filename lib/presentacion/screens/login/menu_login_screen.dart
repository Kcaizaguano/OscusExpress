import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/colores/app_colors.dart';
import 'package:flutter_application_2/config/constantes/environment.dart';
import 'package:flutter_application_2/presentacion/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class MenuLoginScreen extends StatelessWidget {
  static const nombre = 'menu_login_screen';
  const MenuLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blancoOscus,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(Environment.logoOscus)),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BotonIconoWidget(
                    icon: Icons.person,
                    text: 'Usuario y Contraseña',
                    textColor: AppColors.azulOscus,
                    iconColor: AppColors.verdeOscus,
                    buttonColor: AppColors.blancoOscus,
                    onPressed: () {
                      context.pushNamed(HomePageScreen.nombre);
                    }),
                const SizedBox(
                  width: 30,
                ),
                BotonIconoWidget(
                    icon: Icons.fingerprint,
                    text: 'Huella / Face ID',
                    textColor: AppColors.azulOscus,
                    iconColor: AppColors.verdeOscus,
                    buttonColor: AppColors.blancoOscus,
                    onPressed: () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}
