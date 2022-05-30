import 'package:ansque/src/shared/routing/route_argument.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BasePilot {
  static void move<A extends RouteArgument>({
    required BuildContext context,
    required String path,
    A? arguments,
    bool replace = false,
  }) {
    if (replace) {
      context.go(path, extra: arguments);
    } else {
      context.push(path, extra: arguments);
    }
  }
}
