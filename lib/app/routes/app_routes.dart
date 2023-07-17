import 'package:go_router/go_router.dart';
import 'package:responsive_app/app/app.dart';
import 'package:responsive_app/app/ui/intranet_login/admin_page.dart';
import 'package:responsive_app/app/ui/intranet_login/student_page.dart';
import 'package:responsive_app/app/ui/intranet_login/teacher_page.dart';

class CustomRouter {
  static final router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) => const App(),
      ),
      GoRoute(
        name: 'admin',
        path: '/admin',
        builder: (context, state) => const AdminPage(),
      ),
      GoRoute(
        name: 'teacher',
        path: '/teacher',
        builder: (context, state) => const TeacherPage(),
      ),
      GoRoute(
        name: 'student',
        path: '/student',
        builder: (context, state) => const StudentPage(),
      )
    ],
  );
}
