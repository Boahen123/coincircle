import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:get_it/get_it.dart';

GetIt appConfig = GetIt.instance;

/// The root URL for the CoinGecko API
class AppConfig {
  final String coinRootUrl;

  AppConfig(this.coinRootUrl);
}

/// Load the config file from assets/config/main.json and register the AppConfig singleton
Future<void> loadConfig() async {
  String configData = await rootBundle.loadString('assets/config/main.json');
  Map config = jsonDecode(configData);
  // use the get_it to create singleton of AppConfig
  appConfig
      .registerSingleton<AppConfig>(AppConfig(config['COINGECKO_API_URL']));
}
