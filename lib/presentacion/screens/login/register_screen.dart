import 'package:flutter/material.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter_application_2/presentacion/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  final AuthenticatorState state;
  static const nombre = 'register_screen';

  const RegisterScreen({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      state: state,
      body: const RegistrarseWidget(),
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('¿Ya tienes una cuenta?'),
          TextButton(
            onPressed: () => state.changeStep(
              AuthenticatorStep.signIn,
            ),
            child: const Text('Iniciar Sesión'),
          ),
        ],
      ),
    );
  }
}
