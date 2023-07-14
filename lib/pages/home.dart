import 'dart:convert';
import 'package:coincircle/services/http_service.dart';
import 'package:coincircle/widgets/coin_desc.dart';
import 'package:coincircle/widgets/coin_dropdown.dart';
import 'package:coincircle/widgets/coin_image.dart';
import 'package:coincircle/widgets/current_price.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Home extends StatefulWidget {
  final String? coinId;

  const Home(this.coinId, {super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /// The device height and width
  late double _deviceHeight, _deviceWidth;

  /// The HttpService singleton
  HttpService? _http;

  @override
  void initState() {
    /// Get the HttpService singleton
    _http = GetIt.I.get<HttpService>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CoinDropDown(widget.coinId),
          _data(widget.coinId!),
        ],
      ),
    )));
  }

  Widget _data(String coinId) {
    return StreamBuilder(
      stream: _http?.getData('/coins/$coinId'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          Map data = jsonDecode(snapshot.data.toString());
          num usdPrice = data['market_data']['current_price']['usd'];
          num usdPriceChange =
              data['market_data']['price_change_percentage_24h'];
          Map currentPrices = data['market_data']['current_price'];
          return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                coinImag(
                    imgUrl: data['image']['large'],
                    deviceWidth: _deviceWidth,
                    deviceHeight: _deviceHeight,
                    context: context,
                    currentPrices: currentPrices),
                currentPrice(usdPrice),
                percentageChanger(usdPriceChange),
                description(
                    data["description"]["en"], _deviceHeight, _deviceWidth)
              ]);
        } else {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          ));
        }
      },
    );
  }
}
