import 'package:flutter/material.dart';

class OpcionesScreen extends StatelessWidget {
  const OpcionesScreen({super.key});
  static const nombre = 'opciones-login-pantalla';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opciones de la aplicacion'),
      ),
      body: const Placeholder(),
    );
  }
}
