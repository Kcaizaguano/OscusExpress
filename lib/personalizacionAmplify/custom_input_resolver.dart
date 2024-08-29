import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';

class CustomInputResolver extends InputResolver {
  const CustomInputResolver();

  @override
  String title(BuildContext context, InputField field) {
    switch (field) {
      case InputField.username:
        return 'Usuario';
      case InputField.email:
        return 'Email';
      case InputField.password:
        return 'Contraseña';
      case InputField.passwordConfirmation:
        return 'Confirmar Contraseña';
      default:
        return super.title(context, field);
    }
  }
}
