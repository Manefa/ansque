import 'package:ansque/i18n/generated/intl.g.dart';
import 'package:ansque/src/core/env_config.dart';
import 'package:ansque/src/core/themes/app_theme.dart';
import 'package:ansque/src/flows/shared/logic/localization_cubit.dart';
import 'package:ansque/src/flows/shared/state/localization_state.dart';
import 'package:ansque/src/shared/routing/router.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class Ansque extends StatelessWidget {
  const Ansque({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (_) => LocalizationCubit(SetLocaleState(locale: const Locale("fr"))),
      child: MaterialApp.router(
            title: EnvConfig.appName,
            locale: TranslationProvider.of(context).flutterLocale,
            routeInformationParser: AppRouter.router.routeInformationParser,
            routerDelegate: AppRouter.router.routerDelegate,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.defaultTheme,
            themeMode: ThemeMode.system,
            localizationsDelegates: const [
              CountryLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale?.languageCode && supportedLocale.countryCode == locale?.countryCode) {
                  return supportedLocale;
                }
              }
              return supportedLocales.first;
            },
            supportedLocales: const [
              Locale('fr', ''),
              Locale('en', ''),
            ],
          ),
    );
  }
}