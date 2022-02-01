  import 'package:flutter/services.dart';
  enum Asset {
      _stub,
    enIntl,
ruIntl,

}

final Map<Asset, String> _assetEnumMap = {
Asset.enIntl: 'assets/localizations/en_intl.yaml',
Asset.ruIntl: 'assets/localizations/ru_intl.yaml',

};

class Assets {
String get requirements => requirementsS;
static const String requirementsS = 'assets/documents/requirements.pdf';
String get bottle => bottleS;
static const String bottleS = 'assets/images/bottle.svg';
String get glass => glassS;
static const String glassS = 'assets/images/glass.svg';
String get water => waterS;
static const String waterS = 'assets/images/water.svg';
String get enIntl => enIntlS;
static const String enIntlS = 'assets/localizations/en_intl.yaml';
String get ruIntl => ruIntlS;
static const String ruIntlS = 'assets/localizations/ru_intl.yaml';
    final Map<Asset, String> _preloadedAssets = Map();
    bool isPreloaded = false;
    Future<bool> preloadAssets() async {
      final List<Future> loaders = [];
      loadAsset(Asset asset) async {        
        final String assetContent = await rootBundle.loadString(_assetEnumMap[asset]!, cache: false);
        _preloadedAssets[asset] = assetContent;
      }
      for (Asset assetEnumField in Asset.values) {
        loaders.add(loadAsset(assetEnumField));
      }
      await Future.wait<void>(loaders);
      isPreloaded = true;
      return isPreloaded;
    }
    String getAssetData(Asset assetEnum) {
      if (!isPreloaded) {
        throw Exception('You should run method "preloadAssets" before accessing data with "getAssetData" method');
      }
      return _preloadedAssets[assetEnum]!;
    }
}