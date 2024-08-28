import 'package:flutter_application_2/presentacion/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
    initialLocation: '/', //cuando quiero que inicie en una ruta en especifico,
    routes: [
      GoRoute(
        path: '/',
        name: BienvenidoScreen
            .nombre, //esto si se trabaja con los nombres de cada pantalla
        builder: (context, state) => const BienvenidoScreen(),
      ),
      GoRoute(
        path: '/opciones-login',
        name: OpcionesScreen.nombre,
        builder: (context, state) => const OpcionesScreen(),
      ),
    ]);
