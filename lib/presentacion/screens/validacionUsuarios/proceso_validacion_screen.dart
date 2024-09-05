import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/colores/app_colors.dart';
import 'package:flutter_application_2/data/models/modelos.dart';
import 'package:flutter_application_2/data/repositorios/repositorios.dart';
import 'package:flutter_application_2/data/servicios/servicios.dart';
import 'package:flutter_application_2/presentacion/providers/cedula_provider.dart';
import 'package:flutter_application_2/presentacion/providers/codigo_dactilar_provider.dart';
import 'package:flutter_application_2/presentacion/providers/foto_provider.dart';
import 'package:flutter_application_2/presentacion/providers/validacion_login_provider.dart';
import 'package:flutter_application_2/presentacion/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
    final validacion = ref.read(validacionLoginProvider);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TituloTextWidget(
              text: !validacion ? 'Validando datos' : 'texto',
              textColor: AppColors.verdeOscus),
          const SizedBox(
            height: 20,
          ),
          const CircularProgressIndicator(),
          IconButton(
              onPressed: () async {
                //final sessionID = _crearSessionID();
                //if (await _comparacionRostros(ref)) {}
                //context.pushNamed(HomePageScreen.nombre);
                context.pop();
              },
              icon: const Icon(Icons.access_time_sharp))
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
    return "${response.informacion}";
  } catch (e) {
    return "ERROR EN LA COMPARACION DE ROSTROS: $e";
  }
}

Future<bool> _comparacionRostros(WidgetRef ref) async {
  final autenticacionAwsServices = AutenticacionAwsServices();
  final RespuestaApiRepo respuestaApiRepo =
      RespuestaApiRepo(autenticacionAwsServices: autenticacionAwsServices);
  try {
    final cedula = ref.read(cedulaProvider);
    final dactilar = ref.read(codigoDactilarProvider);
    final foto = ref.read(fotoProvider);

    ComparacionRostroDto comparacion = ComparacionRostroDto(
      foto: foto,
      cedula: cedula,
      dactilar: dactilar,
    );
    final response = await respuestaApiRepo.comparacionRostros(comparacion);
    final similitud = response.anexo['similitud'];
    if (similitud == -300) {
      ref.read(validacionLoginProvider.notifier).state = true;
      return true;
    }
    print(
        'LA RESPUESTA DEL ANEXO ES EN NUMEROS ${response.anexo['similitud']}');
    return false;
  } catch (e) {
    print('ERROR EN LA COMPARATIVA DE ROSTROS  : $e');
    return false;
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
