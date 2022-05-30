import 'package:flutter/material.dart';

abstract class LocalizationState {
  final Locale locale;

  LocalizationState({required this.locale});
}

class SetLocaleState extends LocalizationState {
  SetLocaleState({required Locale locale}) : super(locale: locale);
}
