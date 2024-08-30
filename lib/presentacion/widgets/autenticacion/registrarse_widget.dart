import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/comunes/utils.dart';

class RegistrarseWidget extends StatelessWidget {
  const RegistrarseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SignUpForm.custom(
      fields: [
        SignUpFormField.username(),
        SignUpFormField.password(),
        SignUpFormField.email(required: true),
        SignUpFormField.custom(
          title: 'Cedula',
          attributeKey: CognitoUserAttributeKey.name,
          required: true,
          hintText: 'Ingrese cédula',
          validator: validateCedula,
        ),
        SignUpFormField.custom(
            title: 'Código Dactilar',
            attributeKey: CognitoUserAttributeKey.familyName,
            required: true,
            hintText:
                'Código dactilar, ubicado al reverso de tu cedula (V4433V)',
            validator: validateCD),
      ],
    );
  }

  String? validateCedula(String? cedula) {
    if (cedula == null || cedula.isEmpty) return 'La cédula es requerida';

    if (cedula.length != 10)
      return 'La cédula debe tener exactamente 10 dígitos';

    if (!RegExp(r'^\d+$').hasMatch(cedula))
      return 'La cédula solo debe contener números';

    if (!verificarNumeroCedula(cedula)) return 'La cédula  no es  válida';
    return null;
  }

  String? validateCD(String? cdg) {
    if (cdg == null || cdg.isEmpty) return 'El código dactilar  es requerido';
    if (cdg.length != 4) return 'El codigo dactilar tiene que tener 4 dígitos';

    return null;
  }
}
