import 'package:flutter/material.dart';
import 'package:coincircle/pages/home.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'data/app_config.dart';

GetIt appConfig = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadConfig();
  runApp(const MyApp());
}

Future<void> loadConfig() async {
  String configData = await rootBundle.loadString('assets/config/main.json');
  Map config = jsonDecode(configData);
  print(config['COINGECKO_API_URL']);
  // use the get_it to create singleton of AppConfig
  appConfig
      .registerSingleton<AppConfig>(AppConfig(config['COINGECKO_API_URL']));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoinCircle',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
