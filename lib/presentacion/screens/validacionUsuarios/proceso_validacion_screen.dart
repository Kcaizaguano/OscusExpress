import 'package:flutter/material.dart';
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
              onPressed: () {
                final cedula = ref.read(cedulaProvider);
                final codigoDactilar = ref.read(codigoDactilarProvider);
                final foto = ref.read(fotoProvider);

                print('LA CEDULA ES:  $cedula');
                print('EL CODIGO DACTILAR ES:  $codigoDactilar');
                print('LA FOTO ES :  $foto');
              },
              icon: Icon(Icons.access_time_sharp))
        ],
      ),
    );
  }
}
