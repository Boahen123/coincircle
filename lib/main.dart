import 'package:coincircle/services/http_service.dart';
import 'package:coincircle/widgets/coin_page.dart';
import 'package:flutter/material.dart';
import 'package:coincircle/pages/home.dart';
import 'data/app_config.dart';
// import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadConfig();
  registerHttpService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/coinPage': (context) => const CoinPage(),
      },
      title: 'CoinCircle',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.blue,
      ),
      home: const Home('bitcoin'),
    );
  }
}
