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

  @override
  String hint(BuildContext context, InputField field) {
    switch (field) {
      case InputField.username:
        return 'Ingrese su usuario';
      case InputField.email:
        return 'Ingrese su correo electrónico';
      case InputField.password:
        return 'Ingrese su contraseña';
      case InputField.passwordConfirmation:
        return 'Confirme su contraseña';
      default:
        return super.hint(context, field);
    }
  }

  @override
  String empty(BuildContext context, InputField field) {
    switch (field) {
      case InputField.username:
        return 'El campo usuario no debe estar en blanco';
      case InputField.email:
        return 'El campo email no debe estar en blanco';
      case InputField.password:
        return 'El campo contraseña no debe estar en blanco';
      case InputField.passwordConfirmation:
        return 'El campo contraseña no debe estar en blanco';
      default:
        return super.hint(context, field);
    }
  }
}
