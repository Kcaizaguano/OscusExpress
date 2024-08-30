import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter_application_2/presentacion/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
    initialLocation:
        '/tomar_fotografia', //cuando quiero que inicie en una ruta en especifico,
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
        path: '/tomar_fotografia',
        name: TomarFotografiaScreen.nombre,
        builder: (context, state) => const TomarFotografiaScreen(),
      ),
    ]);
