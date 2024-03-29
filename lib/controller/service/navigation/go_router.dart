import 'package:go_router/go_router.dart';
import 'package:postmo/controller/service/navigation/navigation_service.dart';
import 'package:postmo/controller/service/transition/transitions.dart';
import 'package:postmo/view/screen/auth/login/screen/login_screen.dart';
import 'package:postmo/view/screen/auth/register/screen/register_screen.dart';
import 'package:postmo/view/screen/home/screen/home_screen.dart';
import 'package:postmo/view/screen/main/screen/main_screen.dart';
import 'package:postmo/view/screen/note/screen/note_screen.dart';
import 'package:postmo/view/screen/only_photo/screen/only_photo_screen.dart';
import 'package:postmo/view/screen/start/screen/start_screen.dart';
import 'package:postmo/view/test_screen.dart';

class AppGoRouter {
  final router = GoRouter(
    navigatorKey: NavigationService.navigatorKey,
    initialLocation: MainScreen.routeName,
    routes: [
      GoRoute(
        path: TestScreen.routeName,
        pageBuilder: (context, state) => fadeTransition(
          state,
          const TestScreen(),
        ),
      ),
      GoRoute(
        path: StartScreen.routeName,
        pageBuilder: (context, state) => fadeTransition(
          state,
          const StartScreen(),
        ),
      ),
      GoRoute(
        path: LoginScreen.routeName,
        pageBuilder: (context, state) => fadeTransition(
          state,
          const LoginScreen(),
        ),
      ),
      GoRoute(
        path: RegisterScreen.routeName,
        pageBuilder: (context, state) => fadeTransition(
          state,
          const RegisterScreen(),
        ),
      ),
      GoRoute(
        path: HomeScreen.routeName,
        pageBuilder: (context, state) => fadeTransition(
          state,
          const HomeScreen(),
        ),
      ),
      GoRoute(
        path: MainScreen.routeName,
        pageBuilder: (context, state) => fadeTransition(
          state,
          const MainScreen(),
        ),
      ),
      GoRoute(
        path: OnlyPhotoScreen.routeName,
        pageBuilder: (context, state) => fadeTransition(
          state,
          const OnlyPhotoScreen(),
        ),
      ),
      GoRoute(
        path: NoteScreen.routeName,
        pageBuilder: (context, state) => fadeTransition(
          state,
          const NoteScreen(),
        ),
      ),
    ],
  );
}
