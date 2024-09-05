import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/colores/app_colors.dart';
import 'package:flutter_application_2/presentacion/providers/cedula_provider.dart';
import 'package:flutter_application_2/presentacion/providers/codigo_dactilar_provider.dart';
import 'package:flutter_application_2/presentacion/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class InicioRegisterScreen extends ConsumerWidget {
  final AuthenticatorState state;
  static const nombre = 'inicio_registro_screen';
  const InicioRegisterScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController _cedulaController = TextEditingController();
    final TextEditingController _codigoDactilarController =
        TextEditingController();

    return Scaffold(
      appBar: const AppBarLogoOscusWidget(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TituloTextWidget(
                  text: '¡Empecemos!', textColor: AppColors.verdeOscus),
              const SubTituloTextWidget(
                  text: 'Ingresa tus datos', textColor: AppColors.azulOscus),
              TextField(
                controller: _cedulaController,
                decoration: const InputDecoration(
                  labelText: 'Cédula',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _codigoDactilarController,
                decoration: const InputDecoration(
                  labelText: 'Código Dactilar',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final cedula = _cedulaController.text;
                  final codigoDactilar = _codigoDactilarController.text;
                  ref.read(cedulaProvider.notifier).state = cedula;
                  ref.read(codigoDactilarProvider.notifier).state =
                      codigoDactilar;
                  // Ejemplo de navegación
                  state.changeStep(AuthenticatorStep.signUp);
                  context.pushNamed(TomarFotografiaScreen.nombre);
                },
                child: const Text('Continuar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
