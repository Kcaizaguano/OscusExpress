import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/servicios/servicios.dart';
import 'package:flutter_application_2/presentacion/providers/cedula_provider.dart';
import 'package:flutter_application_2/presentacion/providers/codigo_dactilar_provider.dart';
import 'package:flutter_application_2/presentacion/providers/foto_provider.dart';
import 'package:flutter_application_2/presentacion/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProcesoValidacionScreen extends StatelessWidget {
  static const nombre = 'proceso_validacion';
  const ProcesoValidacionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarLogoOscusWidget(),
      body: _validaciones(),
    );
  }
}

class _validaciones extends ConsumerWidget {
  const _validaciones();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          IconButton(
              onPressed: () => _crearSessionID(context),
              icon: Icon(Icons.access_time_sharp))
        ],
      ),
    );
  }
}

Future<void> _crearSessionID(BuildContext context) async {
  final autenticacionAwsServices = AutenticacionAwsServices();
  try {
    await autenticacionAwsServices.getSessionID();
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error al comparar rostros: $e')),
    );
  }
}
