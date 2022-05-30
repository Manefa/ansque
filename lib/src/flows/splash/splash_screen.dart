import 'dart:async';

import 'package:ansque/src/core/themes/app_theme.dart';
import 'package:ansque/src/flows/app_pilot.dart';
import 'package:ansque/src/services/status_bar_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String path = "/";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      StatusBarManager.setColor(
        iconBrightness: Brightness.dark,
        color: AppTheme.defaultTheme.scaffoldBackgroundColor,
      );

      Timer(const Duration(seconds: 3), () {
        AppPilot.onboarding(context: context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}