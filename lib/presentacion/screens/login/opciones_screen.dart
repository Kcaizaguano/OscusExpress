import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/colores/app_colors.dart';
import 'package:flutter_application_2/presentacion/widgets/widgets.dart';

class OpcionesScreen extends StatelessWidget {
  const OpcionesScreen({super.key});
  static const nombre = 'opciones-login-pantalla';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarLogoOscusWidget(),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _MenuBotton(
                    onPressed: () {
                      //AuthenticatorStep.signUp;
                    },
                    icon: Icons.person,
                    text: "Usuario y Contraseña",
                  ),
                  const SizedBox(width: 100.0),
                  _MenuBotton(
                    onPressed: () {},
                    icon: Icons.fingerprint,
                    text: 'Huella / Face ID',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  // Acción al hacer clic en el texto
                  print('Enlace clicado');
                  // Aquí puedes agregar la navegación o cualquier otra acción
                },
                child: const Text(
                  'Ayuda para ingresar',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue, // Color del texto como enlace
                    decoration: TextDecoration.underline, // Subrayar el texto
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuBotton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String text;

  const _MenuBotton(
      {required this.onPressed, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.celesteOscus,
              elevation: 15,
              shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(20)), // Bordes rectos
              ),
            ),
            child: Icon(
              icon,
              color: AppColors.azulOscus,
              size: 100,
            )),
        const SizedBox(height: 10),
        TextWidget(text: text, textColor: AppColors.celesteOscus, size: 15)
      ],
    );
  }
}
