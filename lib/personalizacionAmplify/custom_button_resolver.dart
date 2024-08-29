import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';

class CustomButtonResolver extends ButtonResolver {
  const CustomButtonResolver();

  @override
  String signIn(BuildContext context) {
    return 'INGRESAR';
  }

  @override
  String signUp(BuildContext context) {
    return 'REGISTRARSE';
  }

  @override
  String submit(BuildContext context) {
    return 'Enviar';
  }

  @override
  String forgotPassword(BuildContext context) {
    return '¿Olvidaste tu contraseña?';
  }
}
