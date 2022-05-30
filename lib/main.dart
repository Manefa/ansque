import 'package:ansque/i18n/generated/intl.g.dart';
import 'package:ansque/src/core/ansque.dart';
import 'package:ansque/src/core/app_initializer.dart';
import 'package:ansque/src/shared/logic/app_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppInitializer.init();
  Firebase.initializeApp();

  runApp(
    TranslationProvider(
        child: BlocProvider(
          create: (_) => AppCubit(),
          child: const Ansque(),
        ),
    ),
  );
}
