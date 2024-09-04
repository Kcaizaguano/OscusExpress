import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/models/modelos.dart';
import 'package:flutter_application_2/data/repositorios/repositorios.dart';
import 'package:flutter_application_2/data/servicios/servicios.dart';
import 'package:flutter_application_2/presentacion/providers/cedula_provider.dart';
import 'package:flutter_application_2/presentacion/providers/codigo_dactilar_provider.dart';
import 'package:flutter_application_2/presentacion/providers/foto_provider.dart';
import 'package:flutter_application_2/presentacion/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProcesoValidacionScreen extends StatefulWidget {
  static const nombre = 'proceso_validacion';
  const ProcesoValidacionScreen({super.key});

  @override
  State<ProcesoValidacionScreen> createState() =>
      _ProcesoValidacionScreenState();
}

class _ProcesoValidacionScreenState extends State<ProcesoValidacionScreen> {
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
                //final sessionID = _crearSessionID();
                final cedula = ref.read(cedulaProvider);
                final dactilar = ref.read(codigoDactilarProvider);
                final foto = ref.read(fotoProvider);

                ComparacionRostroDto comparacion = ComparacionRostroDto(
                  foto: foto,
                  cedula: cedula,
                  dactilar: dactilar,
                );
                print('datos que se van a compara $comparacion');
                _comparacionRostros(comparacion);
              },
              icon: Icon(Icons.access_time_sharp))
        ],
      ),
    );
  }
}

Future<String> _crearSessionID() async {
  final autenticacionAwsServices = AutenticacionAwsServices();
  final RespuestaApiRepo respuestaApiRepo =
      RespuestaApiRepo(autenticacionAwsServices: autenticacionAwsServices);
  try {
    final response = await respuestaApiRepo.getSessionID();
    print('la respuesta es ${response}');
    return "${response.informacion}";
  } catch (e) {
    return "ERROR EN LA COMPARACION DE ROSTROS: $e";
  }
}

Future<void> _comparacionRostros(
    ComparacionRostroDto comparacionRostroDto) async {
  final autenticacionAwsServices = AutenticacionAwsServices();
  final RespuestaApiRepo respuestaApiRepo =
      RespuestaApiRepo(autenticacionAwsServices: autenticacionAwsServices);
  try {
    final response =
        await respuestaApiRepo.comparacionRostros(comparacionRostroDto);
    print('la respuesta es ${response.anexo}');
  } catch (e) {
    //return "ERROR EN LA COMPARACION DE ROSTROS: $e";
    print('ERROR EN LA COMPARATIVA DE ROSTROS  : $e');
  }
}



// Future<void> _resultadosSessionID(String sesionID) async {
//   final autenticacionAwsServices = AutenticacionAwsServices();
//   final RespuestaApiRepo respuestaApiRepo =
//       RespuestaApiRepo(autenticacionAwsServices: autenticacionAwsServices);
//   try {
//     final response = await respuestaApiRepo.getResultadosSessionID();
//     print('la respuesta es ${response}');
//   } catch (e) {
//     print('ERRO AL COMPARA ROSTROS $e');
//   }
// }
