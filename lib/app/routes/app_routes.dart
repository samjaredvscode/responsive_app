import 'package:go_router/go_router.dart';
import 'package:responsive_app/app/app.dart';
import 'package:responsive_app/app/ui/intranet_login/admin_page.dart';
import 'package:responsive_app/app/ui/intranet_login/student_page.dart';
import 'package:responsive_app/app/ui/intranet_login/teacher_page.dart';

class CustomRouter {
  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        builder: (context, state) => const App(),
      ),
      GoRoute(
        name: 'admin',
        path: '/administrador',
        builder: (context, state) => const AdminPage(),
      ),
      GoRoute(
        name: 'teacher',
        path: '/docente',
        builder: (context, state) => const TeacherPage(),
      ),
      GoRoute(
        name: 'student',
        path: '/estudiante',
        builder: (context, state) => const StudentPage(),
      )
    ],
  );
}
