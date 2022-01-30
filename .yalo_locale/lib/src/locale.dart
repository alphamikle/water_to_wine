import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/src/widgets/localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

      abstract class _JugViewModal {
      late String fieldHint;
      late String button;
      }
      class _EnJugViewModal extends _JugViewModal {
      /// Description: ""
    /// Example: "Input capacity for jug"
    @override
    final String fieldHint = Intl.message('Input capacity for jug', name: 'fieldHint', desc: '');
      /// Description: ""
    /// Example: "Select"
    @override
    final String button = Intl.message('Select', name: 'button', desc: '');
      }
      abstract class _JugView {
      late String emptyJugHint;
      late _JugViewModal modal;
      }
      class _EnJugView extends _JugView {
      /// Description: ""
    /// Example: "Tap me"
    @override
    final String emptyJugHint = Intl.message('Tap me', name: 'emptyJugHint', desc: '');
      @override
    final _JugViewModal modal = _EnJugViewModal();
      }
      abstract class LocalizationMessages {
      late String appTitle;
      late _JugView jugView;
      }
      class _En extends LocalizationMessages {
      /// Description: ""
    /// Example: "Water Jugs"
    @override
    final String appTitle = Intl.message('Water Jugs', name: 'appTitle', desc: '');
      @override
    final _JugView jugView = _EnJugView();
      }
      class _RuJugViewModal extends _JugViewModal {
      /// Description: ""
    /// Example: "Введите объем кувшина"
    @override
    final String fieldHint = Intl.message('Введите объем кувшина', name: 'fieldHint', desc: '');
      /// Description: ""
    /// Example: "Выбрать"
    @override
    final String button = Intl.message('Выбрать', name: 'button', desc: '');
      }
      class _RuJugView extends _JugView {
      /// Description: ""
    /// Example: "Нижми меня"
    @override
    final String emptyJugHint = Intl.message('Нижми меня', name: 'emptyJugHint', desc: '');
      @override
    final _JugViewModal modal = _RuJugViewModal();
      }
      class _Ru extends LocalizationMessages {
      /// Description: ""
    /// Example: "Водные кувшины"
    @override
    final String appTitle = Intl.message('Водные кувшины', name: 'appTitle', desc: '');
      @override
    final _JugView jugView = _RuJugView();
      }
    class LocalizationDelegate extends LocalizationsDelegate<LocalizationMessages> {
    @override
    bool isSupported(Locale locale) => _languageMap.keys.contains(locale.languageCode);
  
    @override
    Future<LocalizationMessages> load(Locale locale) async {
      Intl.defaultLocale = locale.countryCode == null ? locale.languageCode : locale.toString();
      return _languageMap[locale.languageCode]!;
    }
    
    @override
    bool shouldReload(LocalizationsDelegate<LocalizationMessages> old) => false;

    final Map<String, LocalizationMessages> _languageMap = {
      'en': _En(),
        'ru': _Ru(),
      };

    }

    class Messages {
    static LocalizationMessages of(BuildContext context) => Localizations.of(context, LocalizationMessages);

    static LocalizationMessages get en => LocalizationDelegate()._languageMap['en']!;
    static LocalizationMessages get ru => LocalizationDelegate()._languageMap['ru']!;
    
    
    static LocalizationMessages? getLocale(String locale) {
      final List<String> localeData = locale.split('_');
      String languageCode = '';
      String countryCode = '';
      if (localeData.isEmpty) {
        throw Exception('Not found any locale info in string ${locale}');
      }
      languageCode = localeData[0];
      if (localeData.length > 1) {
        countryCode = localeData[1];
      }
      return LocalizationDelegate()._languageMap[languageCode];
    }
  }
  
  final List<LocalizationsDelegate> localizationsDelegates = [LocalizationDelegate(), ...GlobalMaterialLocalizations.delegates];

  const List<Locale> supportedLocales = [
const Locale('en'),
    const Locale('ru'),
    ];