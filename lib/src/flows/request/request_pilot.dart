import 'package:ansque/src/flows/request/request_detail/request_detail_screen.dart';
import 'package:ansque/src/flows/shared/base_pilot.dart';
import 'package:flutter/material.dart';

class RequestPilot{
  static void goToDetailScreen({required BuildContext context}) {
    BasePilot.move(context: context, path: RequestDetailScreen.path);
  }
}