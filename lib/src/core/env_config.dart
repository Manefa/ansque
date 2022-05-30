import 'package:flutter/widgets.dart';

@immutable
class EnvConfig {
  static const String appName = String.fromEnvironment("app_name");
}