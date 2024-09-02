// lib/presentation/auth_widget.dart
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/personalizacionAmplify/custom_button_resolver.dart';
import 'package:flutter_application_2/personalizacionAmplify/custom_input_resolver.dart';
import 'package:flutter_application_2/presentacion/widgets/widgets.dart';

class AutenticacionScreen extends StatelessWidget {
  static const nombre = 'autenticacion_amplify';
  const AutenticacionScreen({super.key});

  static const stringResolver = AuthStringResolver(
    buttons: CustomButtonResolver(),
    inputs: CustomInputResolver(),
  );

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      stringResolver: stringResolver,
      authenticatorBuilder: (BuildContext context, AuthenticatorState state) {
        switch (state.currentStep) {
          case AuthenticatorStep.signIn:
            return CustomScaffold(
              state: state,
              body: SignInForm(),
              footer: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('¿No tienes cuenta?'),
                  TextButton(
                    onPressed: () => state.changeStep(
                      AuthenticatorStep.signUp,
                    ),
                    child: const Text('Regístrate'),
                  ),
                ],
              ),
            );
          case AuthenticatorStep.signUp:
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
          case AuthenticatorStep.confirmSignUp:
            return CustomScaffold(
              state: state,
              body: ConfirmSignUpForm(),
            );
          case AuthenticatorStep.resetPassword:
            return CustomScaffold(
              state: state,
              body: ResetPasswordForm(),
            );
          case AuthenticatorStep.confirmResetPassword:
            return CustomScaffold(
              state: state,
              body: const ConfirmResetPasswordForm(),
            );
          default:
            return null;
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
