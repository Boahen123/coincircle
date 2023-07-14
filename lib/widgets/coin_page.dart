import 'package:flutter/material.dart';
import 'package:coincircle/pages/home.dart';

/// Page to display the selected coin
class CoinPage extends StatefulWidget {
  const CoinPage({super.key});

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  @override
  Widget build(BuildContext context) {
    final Object? args = ModalRoute.of(context)!.settings.arguments;
    Map argsMap = args as Map;
    final String coinId = argsMap['id'] ?? 'bitcoin';

    return Home(coinId);
  }
}
