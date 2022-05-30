import 'package:ansque/src/core/themes/app_colors.dart';
import 'package:ansque/src/core/themes/dimens.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static final defaultTheme = _lightTheme;

  static final ThemeData _lightTheme =ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    primaryColor:AppColors.primary,
    focusColor: AppColors.secondary,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      onPrimary: Colors.white,
      onSecondary: Colors.white
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: Dimens.h1,
          color: Colors.black,
          fontWeight: FontWeight.w800,
          fontFamily: 'Century Gothic'
      ),
      headline2: TextStyle(
        fontSize: Dimens.h2,
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontFamily: 'Century Gothic',
      ),
      headline3: TextStyle(
        fontSize: Dimens.h3,
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontFamily: 'Century Gothic',
      ),
      bodyText2: TextStyle(
        fontSize: Dimens.paragraph,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontFamily: 'Century Gothic',
      ),
      subtitle1: TextStyle(fontSize: Dimens.subtitle1, color: Colors.black, fontFamily: 'Century Gothic'),
    )
  );
}