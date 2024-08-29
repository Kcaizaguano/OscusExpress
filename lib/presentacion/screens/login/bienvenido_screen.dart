import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/colores/app_colors.dart';
import 'package:flutter_application_2/config/constantes/environment.dart';
import 'package:flutter_application_2/presentacion/screens/screens.dart';
import 'package:flutter_application_2/presentacion/widgets/botons/boton_widget.dart';
import 'package:go_router/go_router.dart';

class BienvenidoScreen extends StatelessWidget {
  const BienvenidoScreen({super.key});
  static const nombre = 'bienvenido_login_pantalla';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Bienvenido(),
    );
  }
}

class _Bienvenido extends StatelessWidget {
  const _Bienvenido();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(Environment.logoOscus)),
          const SizedBox(height: 80),
          const Text(
            'Bienvenido/a la banca movil',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.azulSplashOscus,
            ),
          ),
          const SizedBox(height: 20),
          BotonWidget(
              text: 'INGRESAR',
              color: AppColors.celesteOscus,
              textColor: AppColors.azulOscus,
              onPressed: () {
                context.pushNamed(OpcionesScreen.nombre);
              }),
          const SizedBox(height: 10),
          BotonWidget(
              text: 'REGISTRARSE',
              color: AppColors.azulOscus,
              textColor: AppColors.blancoOscus,
              onPressed: () {
                context.pushNamed(HomePageScreen.nombre);
              })
        ],
      ),
    );
  }
}
