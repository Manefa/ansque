
/*
 * Generated file. Do not edit.
 *
 * Locales: 2
 * Strings: 12 (6.0 per locale)
 *
 * Built on 2022-05-10 at 15:50 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.fr;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.fr) // set locale
/// - Locale locale = AppLocale.fr.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.fr) // locale check
enum AppLocale {
	fr, // 'fr' (base locale, fallback)
	en, // 'en'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of I18n).
///
/// Usage:
/// String a = I18n.someKey.anotherKey;
/// String b = I18n['someKey.anotherKey']; // Only for edge cases!
_IntlFr _I18n = _currLocale.translations;
_IntlFr get I18n => _I18n;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final I18n = Translations.of(context); // Get I18n variable.
/// String a = I18n.someKey.anotherKey; // Use I18n variable.
/// String b = I18n['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _IntlFr of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale useDeviceLocale() {
		final locale = AppLocaleUtils.findDeviceLocale();
		return setLocale(locale);
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_I18n = _currLocale.translations;

		if (WidgetsBinding.instance != null) {
			// force rebuild if TranslationProvider is used
			_translationProviderKey.currentState?.setLocale(_currLocale);
		}

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String rawLocale) {
		final locale = AppLocaleUtils.parse(rawLocale);
		return setLocale(locale);
	}

	/// Gets current locale.
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
	AppLocaleUtils._(); // no constructor

	/// Returns the locale of the device as the enum type.
	/// Fallbacks to base locale.
	static AppLocale findDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance?.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			final typedLocale = _selectLocale(deviceLocale);
			if (typedLocale != null) {
				return typedLocale;
			}
		}
		return _baseLocale;
	}

	/// Returns the enum type of the raw locale.
	/// Fallbacks to base locale.
	static AppLocale parse(String rawLocale) {
		return _selectLocale(rawLocale) ?? _baseLocale;
	}
}

// context enums

// interfaces generated as mixins

// translation instances

late _IntlFr _translationsFr = _IntlFr.build();
late _IntlEn _translationsEn = _IntlEn.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_IntlFr get translations {
		switch (this) {
			case AppLocale.fr: return _translationsFr;
			case AppLocale.en: return _translationsEn;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.fr.build(); // build
	/// String a = t.my.path; // access
	_IntlFr build() {
		switch (this) {
			case AppLocale.fr: return _IntlFr.build();
			case AppLocale.en: return _IntlEn.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.fr: return 'fr';
			case AppLocale.en: return 'en';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.fr: return const Locale.fromSubtags(languageCode: 'fr');
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'fr': return AppLocale.fr;
			case 'en': return AppLocale.en;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _IntlFr translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

// Path: <root>
class _IntlFr {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_IntlFr.build();

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	late final _IntlFr _root = this; // ignore: unused_field

	// Translations
	late final _IntlOnboardingFr onboarding = _IntlOnboardingFr._(_root);
}

// Path: onboarding
class _IntlOnboardingFr {
	_IntlOnboardingFr._(this._root);

	final _IntlFr _root; // ignore: unused_field

	// Translations
	String get firstStep => 'D??poser vos requ??tes de fa??on simple';
	String get secondStep => 'Suivre l?????volution de vos requ??tes';
	String get previous => 'Pr??c??dent';
	String get next => 'Suivant';
	String get start => 'Commencer';
	String get skip => 'Sauter';
}

// Path: <root>
class _IntlEn extends _IntlFr {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_IntlEn.build()
		: super.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _IntlEn _root = this; // ignore: unused_field

	// Translations
	@override late final _IntlOnboardingEn onboarding = _IntlOnboardingEn._(_root);
}

// Path: onboarding
class _IntlOnboardingEn extends _IntlOnboardingFr {
	_IntlOnboardingEn._(_IntlEn root) : this._root = root, super._(root);

	@override final _IntlEn _root; // ignore: unused_field

	// Translations
	@override String get firstStep => 'Submit your requests in a simple way';
	@override String get secondStep => 'Follow the evolution of your requests';
	@override String get previous => 'Previous';
	@override String get next => 'Next';
	@override String get start => 'Start';
	@override String get skip => 'Skip';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _IntlFr {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'onboarding.firstStep': 'D??poser vos requ??tes de fa??on simple',
			'onboarding.secondStep': 'Suivre l?????volution de vos requ??tes',
			'onboarding.previous': 'Pr??c??dent',
			'onboarding.next': 'Suivant',
			'onboarding.start': 'Commencer',
			'onboarding.skip': 'Sauter',
		};
	}
}

extension on _IntlEn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'onboarding.firstStep': 'Submit your requests in a simple way',
			'onboarding.secondStep': 'Follow the evolution of your requests',
			'onboarding.previous': 'Previous',
			'onboarding.next': 'Next',
			'onboarding.start': 'Start',
			'onboarding.skip': 'Skip',
		};
	}
}
