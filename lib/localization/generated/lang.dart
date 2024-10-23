import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'lang_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of Lang
/// returned by `Lang.of(context)`.
///
/// Applications need to include `Lang.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/lang.dart';
///
/// return MaterialApp(
///   localizationsDelegates: Lang.localizationsDelegates,
///   supportedLocales: Lang.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the Lang.supportedLocales
/// property.
abstract class Lang {
  Lang(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static Lang of(BuildContext context) {
    return Localizations.of<Lang>(context, Lang)!;
  }

  static const LocalizationsDelegate<Lang> delegate = _LangDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('es')
  ];

  /// No description provided for @home.
  ///
  /// In es, this message translates to:
  /// **'Inicio'**
  String get home;

  /// No description provided for @banCard.
  ///
  /// In es, this message translates to:
  /// **'Cartas bloqueadas'**
  String get banCard;

  /// No description provided for @idNoInternet.
  ///
  /// In es, this message translates to:
  /// **'Sin acceso a internet'**
  String get idNoInternet;

  /// No description provided for @idNoInternetMessage.
  ///
  /// In es, this message translates to:
  /// **'Comprueba tus conexiones'**
  String get idNoInternetMessage;

  /// No description provided for @idOk.
  ///
  /// In es, this message translates to:
  /// **'Entendido'**
  String get idOk;

  /// No description provided for @idNoFoundTitle.
  ///
  /// In es, this message translates to:
  /// **'No se encontraron resultados'**
  String get idNoFoundTitle;

  /// No description provided for @idNoFoundMessage.
  ///
  /// In es, this message translates to:
  /// **'Intenta buscando nuevamente con otro tipo de palabras'**
  String get idNoFoundMessage;

  /// No description provided for @idNoElementsTitle.
  ///
  /// In es, this message translates to:
  /// **'No hay elementos'**
  String get idNoElementsTitle;

  /// No description provided for @idNoElementsMessage.
  ///
  /// In es, this message translates to:
  /// **'No hay elementos para mostrar'**
  String get idNoElementsMessage;

  /// No description provided for @search.
  ///
  /// In es, this message translates to:
  /// **'Buscar'**
  String get search;

  /// No description provided for @arquetipes.
  ///
  /// In es, this message translates to:
  /// **'Arquetipos'**
  String get arquetipes;

  /// No description provided for @banlist.
  ///
  /// In es, this message translates to:
  /// **'Lista de Cartas prohibidas'**
  String get banlist;

  /// No description provided for @arquetipeDetail.
  ///
  /// In es, this message translates to:
  /// **'Detalles del arquetipo'**
  String get arquetipeDetail;

  /// No description provided for @cardDetail.
  ///
  /// In es, this message translates to:
  /// **'Detalles de la carta'**
  String get cardDetail;
}

class _LangDelegate extends LocalizationsDelegate<Lang> {
  const _LangDelegate();

  @override
  Future<Lang> load(Locale locale) {
    return SynchronousFuture<Lang>(lookupLang(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['es'].contains(locale.languageCode);

  @override
  bool shouldReload(_LangDelegate old) => false;
}

Lang lookupLang(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'es': return LangEs();
  }

  throw FlutterError(
    'Lang.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
