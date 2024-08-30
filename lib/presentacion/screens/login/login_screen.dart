import 'package:flutter/material.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter_application_2/presentacion/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  final AuthenticatorState state;
  static const nombre = 'login_screen';

  const LoginScreen({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      state: state,
      body: SignInForm(),
      footer: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('¿No tienes cuenta?'),
            TextButton(
              onPressed: () => state.changeStep(
                AuthenticatorStep.signUp,
              ),
              child: const Text('Registrate'),
            ),
          ],
        ),
      ),
    );
  }
}
