import 'package:go_router/go_router.dart';
import 'package:responsive_app/app/app.dart';

class CustomRouter {
  static final router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) => const App(),
      )
    ],
  );
}
