import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';

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
        SignUpFormField.passwordConfirmation(),
        SignUpFormField.email(required: true),
        SignUpFormField.custom(
          title: 'Cedula',
          attributeKey: CognitoUserAttributeKey.name,
          required: true,
        ),
        SignUpFormField.custom(
          title: 'Código Dactilar',
          attributeKey: CognitoUserAttributeKey.familyName,
          required: true,
        ),
      ],
    );
  }
}
