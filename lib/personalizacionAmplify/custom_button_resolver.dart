import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';

class CustomButtonResolver extends ButtonResolver {
  const CustomButtonResolver();

  @override
  String signIn(BuildContext context) {
    return 'Ingresar';
  }

  @override
  String signUp(BuildContext context) {
    return 'Registrarse';
  }

  @override
  String submit(BuildContext context) {
    return 'Enviar';
  }

  @override
  String forgotPassword(BuildContext context) {
    return '¿Olvidaste tu contraseña?';
  }

  @override
  String confirmResetPassword(BuildContext context) {
    return 'Restablecer contraseña';
  }

  @override
  String changePassword(BuildContext context) {
    return 'Cambiar contraseña';
  }

  @override
  String sendCode(BuildContext context) {
    return 'Enviar código';
  }

  @override
  String verify(BuildContext context) {
    return 'Verificar';
  }

  @override
  String signout(BuildContext context) {
    return 'Salir';
  }

  @override
  String backTo(BuildContext context, previousStep) {
    return 'Volver para iniciar Sesión';
  }
}
