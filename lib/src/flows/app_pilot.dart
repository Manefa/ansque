import 'package:ansque/src/flows/auth/login/login_screen.dart';
import 'package:ansque/src/flows/home/home_screen.dart';
import 'package:ansque/src/flows/onboarding/onboarding_screen.dart';
import 'package:ansque/src/flows/request/create_request/create_request_screen.dart';
import 'package:ansque/src/flows/shared/base_pilot.dart';
import 'package:flutter/cupertino.dart';

class AppPilot {
  static void onboarding({required BuildContext context}) {
    BasePilot.move(context: context, path: OnboardingScreen.path, replace: true);
  }

  static void goToLogin({required BuildContext context}) {
    BasePilot.move(context: context, path: LoginScreen.path, replace: true);
  }

  static void goToHome({required BuildContext context}) {
    BasePilot.move(context: context, path: HomeScreen.path, replace: true);
  }

  static void showCreateRequest({required BuildContext context}) {
    BasePilot.move(context: context, path: CreateRequestScreen.path);
  }

}