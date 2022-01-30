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
    /// Example: "Set wished capacity amount"
    @override
    final String fieldHint = Intl.message('Set wished capacity amount', name: 'fieldHint', desc: '');
      /// Description: ""
    /// Example: "Select"
    @override
    final String button = Intl.message('Select', name: 'button', desc: '');
      }
      abstract class _JugViewActions {
      late String start;
      late String stop;
      late String setWantedAmount;
      }
      class _EnJugViewActions extends _JugViewActions {
      /// Description: ""
    /// Example: "Start computation"
    @override
    final String start = Intl.message('Start computation', name: 'start', desc: '');
      /// Description: ""
    /// Example: "Stop compute"
    @override
    final String stop = Intl.message('Stop compute', name: 'stop', desc: '');
      /// Description: ""
    /// Example: "Set wanted amount"
    @override
    final String setWantedAmount = Intl.message('Set wanted amount', name: 'setWantedAmount', desc: '');
      }
      abstract class _JugView {
      late String emptyJugHint;
      late _JugViewModal modal;
      late _JugViewActions actions;
      late String wishedAmount;
      }
      class _EnJugView extends _JugView {
      /// Description: ""
    /// Example: "Tap me"
    @override
    final String emptyJugHint = Intl.message('Tap me', name: 'emptyJugHint', desc: '');
      @override
    final _JugViewModal modal = _EnJugViewModal();
      @override
    final _JugViewActions actions = _EnJugViewActions();
      /// Description: ""
    /// Example: "Wished amount: "
    @override
    final String wishedAmount = Intl.message('Wished amount: ', name: 'wishedAmount', desc: '');
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
    /// Example: "Введите желаемый объем"
    @override
    final String fieldHint = Intl.message('Введите желаемый объем', name: 'fieldHint', desc: '');
      /// Description: ""
    /// Example: "Выбрать"
    @override
    final String button = Intl.message('Выбрать', name: 'button', desc: '');
      }
      class _RuJugViewActions extends _JugViewActions {
      /// Description: ""
    /// Example: "Начать расчёты"
    @override
    final String start = Intl.message('Начать расчёты', name: 'start', desc: '');
      /// Description: ""
    /// Example: "Остановить расчёты"
    @override
    final String stop = Intl.message('Остановить расчёты', name: 'stop', desc: '');
      /// Description: ""
    /// Example: "Ввести желаемое количество"
    @override
    final String setWantedAmount = Intl.message('Ввести желаемое количество', name: 'setWantedAmount', desc: '');
      }
      class _RuJugView extends _JugView {
      /// Description: ""
    /// Example: "Нажми меня"
    @override
    final String emptyJugHint = Intl.message('Нажми меня', name: 'emptyJugHint', desc: '');
      @override
    final _JugViewModal modal = _RuJugViewModal();
      @override
    final _JugViewActions actions = _RuJugViewActions();
      /// Description: ""
    /// Example: "Желаемое количество: "
    @override
    final String wishedAmount = Intl.message('Желаемое количество: ', name: 'wishedAmount', desc: '');
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