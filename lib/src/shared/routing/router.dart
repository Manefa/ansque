import 'package:ansque/src/flows/auth/login/login_screen.dart';
import 'package:ansque/src/flows/home/home_screen.dart';
import 'package:ansque/src/flows/onboarding/onboarding_screen.dart';
import 'package:ansque/src/flows/request/create_request/create_request_screen.dart';
import 'package:ansque/src/flows/request/request_detail/request_detail_screen.dart';
import 'package:ansque/src/flows/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter{
  static final router = GoRouter(
    initialLocation: SplashScreen.path,
    routes: [
      GoRoute(
        path: SplashScreen.path,
        builder: (context, state){
          return const SplashScreen();
        }
      ),
      GoRoute(
          path: OnboardingScreen.path,
          builder: (context, state){
            return const OnboardingScreen();
          }
      ),
      GoRoute(
          path: LoginScreen.path,
          builder: (context, state){
            return const LoginScreen();
          }
      ),
      GoRoute(
          path: HomeScreen.path,
          builder: (context, state){
            return const HomeScreen();
          }
      ),
      GoRoute(
          path: CreateRequestScreen.path,
          builder: (context, state){
            return const CreateRequestScreen();
          }
      ),
      GoRoute(
          path: RequestDetailScreen.path,
          builder: (context, state){
            return const RequestDetailScreen();
          }
      ),
    ]
  );
}