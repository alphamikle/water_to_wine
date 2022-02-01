import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/src/widgets/localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

      abstract class _JugViewModal {
      late String button;
      late String firstJugHint;
      late String secondJugHint;
      late String wishedAmountHint;
      late String firstJug;
      late String secondJug;
      late String noSteps;
      late String step;
      }
      class _EnJugViewModal extends _JugViewModal {
      /// Description: ""
    /// Example: "Select"
    @override
    final String button = Intl.message('Select', name: 'button', desc: '');
      /// Description: ""
    /// Example: "Set capacity for the first jug"
    @override
    final String firstJugHint = Intl.message('Set capacity for the first jug', name: 'firstJugHint', desc: '');
      /// Description: ""
    /// Example: "Set capacity for the second jug"
    @override
    final String secondJugHint = Intl.message('Set capacity for the second jug', name: 'secondJugHint', desc: '');
      /// Description: ""
    /// Example: "Set wished capacity"
    @override
    final String wishedAmountHint = Intl.message('Set wished capacity', name: 'wishedAmountHint', desc: '');
      /// Description: ""
    /// Example: "First: "
    @override
    final String firstJug = Intl.message('First: ', name: 'firstJug', desc: '');
      /// Description: ""
    /// Example: "Second: "
    @override
    final String secondJug = Intl.message('Second: ', name: 'secondJug', desc: '');
      /// Description: ""
    /// Example: "No any steps for now"
    @override
    final String noSteps = Intl.message('No any steps for now', name: 'noSteps', desc: '');
      /// Description: ""
    /// Example: "Step: "
    @override
    final String step = Intl.message('Step: ', name: 'step', desc: '');
      }
      abstract class _JugViewActions {
      late String start;
      late String stop;
      late String setWantedAmount;
      late String additional;
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
      /// Description: ""
    /// Example: "Additional info"
    @override
    final String additional = Intl.message('Additional info', name: 'additional', desc: '');
      }
      abstract class _JugViewComputationFinished {
      late String start;
        String end(int howMany);
        }
      class _EnJugViewComputationFinished extends _JugViewComputationFinished {
      /// Description: ""
    /// Example: "Computations took "
    @override
    final String start = Intl.message('Computations took ', name: 'start', desc: '');
      /// Description: "null"
    /// Example: "zero:  steps, one:  step, two:  steps, few:  steps, many:  steps, other:  steps"
    @override
    String end(int howMany) => Intl.plural(howMany,
      name: 'end',
      zero: ' steps',
      one: ' step',
      two: ' steps',
      few: ' steps',
      many: ' steps',
      other: ' steps',
      desc: 'null',
    );
      }
      abstract class _JugViewErrors {
      late String firstNotFilled;
      late String secondNotFilled;
      late String wishedCapacityNotFilled;
      }
      class _EnJugViewErrors extends _JugViewErrors {
      /// Description: ""
    /// Example: "Need to set max volume of the first jug"
    @override
    final String firstNotFilled = Intl.message('Need to set max volume of the first jug', name: 'firstNotFilled', desc: '');
      /// Description: ""
    /// Example: "Need to set max volume of the second jug"
    @override
    final String secondNotFilled = Intl.message('Need to set max volume of the second jug', name: 'secondNotFilled', desc: '');
      /// Description: ""
    /// Example: "Need to set wished capacity"
    @override
    final String wishedCapacityNotFilled = Intl.message('Need to set wished capacity', name: 'wishedCapacityNotFilled', desc: '');
      }
      abstract class _JugView {
      late String emptyJugHint;
      late _JugViewModal modal;
      late _JugViewActions actions;
      late String wishedAmount;
      late _JugViewComputationFinished computationFinished;
      late String impossibleToCompute;
      late _JugViewErrors errors;
      late String thisIsWine;
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
      @override
    final _JugViewComputationFinished computationFinished = _EnJugViewComputationFinished();
      /// Description: ""
    /// Example: "Impossible to find a solution"
    @override
    final String impossibleToCompute = Intl.message('Impossible to find a solution', name: 'impossibleToCompute', desc: '');
      @override
    final _JugViewErrors errors = _EnJugViewErrors();
      /// Description: ""
    /// Example: "Wine"
    @override
    final String thisIsWine = Intl.message('Wine', name: 'thisIsWine', desc: '');
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
    /// Example: "Выбрать"
    @override
    final String button = Intl.message('Выбрать', name: 'button', desc: '');
      /// Description: ""
    /// Example: "Введите объем первого кувшина"
    @override
    final String firstJugHint = Intl.message('Введите объем первого кувшина', name: 'firstJugHint', desc: '');
      /// Description: ""
    /// Example: "Введите объем второго кувшина"
    @override
    final String secondJugHint = Intl.message('Введите объем второго кувшина', name: 'secondJugHint', desc: '');
      /// Description: ""
    /// Example: "Введите требуемый объем"
    @override
    final String wishedAmountHint = Intl.message('Введите требуемый объем', name: 'wishedAmountHint', desc: '');
      /// Description: ""
    /// Example: "Первый: "
    @override
    final String firstJug = Intl.message('Первый: ', name: 'firstJug', desc: '');
      /// Description: ""
    /// Example: "Второй: "
    @override
    final String secondJug = Intl.message('Второй: ', name: 'secondJug', desc: '');
      /// Description: ""
    /// Example: "Шагов пока нет"
    @override
    final String noSteps = Intl.message('Шагов пока нет', name: 'noSteps', desc: '');
      /// Description: ""
    /// Example: "Шаг: "
    @override
    final String step = Intl.message('Шаг: ', name: 'step', desc: '');
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
      /// Description: ""
    /// Example: "Дополнительная информация"
    @override
    final String additional = Intl.message('Дополнительная информация', name: 'additional', desc: '');
      }
      class _RuJugViewComputationFinished extends _JugViewComputationFinished {
      /// Description: ""
    /// Example: "Расчёты завершены за: "
    @override
    final String start = Intl.message('Расчёты завершены за: ', name: 'start', desc: '');
      /// Description: "null"
    /// Example: "zero:  шагов, one:  шаг, two:  шага, few:  шага, many:  шагов, other:  шагов"
    @override
    String end(int howMany) => Intl.plural(howMany,
      name: 'end',
      zero: ' шагов',
      one: ' шаг',
      two: ' шага',
      few: ' шага',
      many: ' шагов',
      other: ' шагов',
      desc: 'null',
    );
      }
      class _RuJugViewErrors extends _JugViewErrors {
      /// Description: ""
    /// Example: "Не установлена ёмкость первого кувшина"
    @override
    final String firstNotFilled = Intl.message('Не установлена ёмкость первого кувшина', name: 'firstNotFilled', desc: '');
      /// Description: ""
    /// Example: "Не установлена ёмкость второго сосуда"
    @override
    final String secondNotFilled = Intl.message('Не установлена ёмкость второго сосуда', name: 'secondNotFilled', desc: '');
      /// Description: ""
    /// Example: "Не задан желаемый объем"
    @override
    final String wishedCapacityNotFilled = Intl.message('Не задан желаемый объем', name: 'wishedCapacityNotFilled', desc: '');
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
      @override
    final _JugViewComputationFinished computationFinished = _RuJugViewComputationFinished();
      /// Description: ""
    /// Example: "Решение невозможно"
    @override
    final String impossibleToCompute = Intl.message('Решение невозможно', name: 'impossibleToCompute', desc: '');
      @override
    final _JugViewErrors errors = _RuJugViewErrors();
      /// Description: ""
    /// Example: "Вино"
    @override
    final String thisIsWine = Intl.message('Вино', name: 'thisIsWine', desc: '');
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