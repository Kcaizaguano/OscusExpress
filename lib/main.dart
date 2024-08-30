import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/config/amplifyconfiguration.dart';
import 'package:flutter_application_2/config/router/app_router.dart';
import 'package:flutter_application_2/personalizacionAmplify/custom_button_resolver.dart';
import 'package:flutter_application_2/personalizacionAmplify/custom_input_resolver.dart';
import 'package:flutter_application_2/presentacion/widgets/widgets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    try {
      await Amplify.addPlugin(AmplifyAuthCognito());
      await Amplify.configure(amplifyconfig);
      safePrint('Successfully configured');
    } on Exception catch (e) {
      safePrint('Error configuring Amplify: $e');
    }
  }

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
              return LoginScreen(state: state);
            case AuthenticatorStep.signUp:
              return RegisterScreen(state: state);
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
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
        ));
  }
}
