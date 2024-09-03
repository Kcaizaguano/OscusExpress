import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter_application_2/presentacion/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
    //initialLocation: '/tomar_fotografia', //cuando quiero que inicie en una ruta en especifico,
    routes: [
      GoRoute(
        path: '/',
        name: MenuLoginScreen.nombre,
        builder: (context, state) => const MenuLoginScreen(),
      ),
      GoRoute(
          path: '/home',
          name: HomePageScreen.nombre,
          builder: (context, state) {
            return const AuthenticatedView(child: HomePageScreen());
          }),
      GoRoute(
        path: '/tomar-fotografia',
        name: TomarFotografiaScreen.nombre,
        builder: (context, state) => const TomarFotografiaScreen(),
      ),
      GoRoute(
        path: '/inicio-registro',
        name: InicioRegisterScreen.nombre,
        builder: (context, state) {
          final authState = state.extra as AuthenticatorState?;
          return InicioRegisterScreen(state: authState!);
        },
      ),
      GoRoute(
        path: '/registrarse',
        name: RegisterScreen.nombre,
        builder: (context, state) {
          final authState = state.extra as AuthenticatorState?;
          return RegisterScreen(state: authState!);
        },
      ),
      GoRoute(
        path: '/validacion',
        name: ProcesoValidacionScreen.nombre,
        builder: (context, state) => const ProcesoValidacionScreen(),
      ),
    ]);
