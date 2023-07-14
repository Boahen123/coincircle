import 'package:flutter/material.dart';
// import 'package:coincircle/pages/home.dart';

final List<String> coins = [
  "bitcoin",
  "ethereum",
  "litecoin",
  "dogecoin",
  "tether",
  "ripple",
  "cardano"
];
final List<DropdownMenuItem<String>> _coinDropdownItems = coins
    .map((String coin) => DropdownMenuItem<String>(
          value: coin,
          child: Text(
            coin,
          ),
        ))
    .toList();

/// A dropdown widget to select a cryptocurrency
class CoinDropDown extends StatefulWidget {
  final String? dropDownValue;
  const CoinDropDown(this.dropDownValue, {super.key});

  @override
  State<CoinDropDown> createState() => _CoinDropDownState();
}

class _CoinDropDownState extends State<CoinDropDown> {
  String? _dropDownValue;

  void _dropDownCallback(String? newValue) {
    setState(() {
      _dropDownValue = newValue;
    });
    Navigator.pushNamed(
      context,
      '/coinPage',
      arguments: {'id': newValue},
    );
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: _coinDropdownItems,
      value: widget.dropDownValue ?? 'bitcoin',
      onChanged: _dropDownCallback,
      dropdownColor: Colors.blue[500],
      iconSize: 25,
      icon: const Icon(Icons.currency_exchange, color: Color(0xFFFFD700)),
      underline: const SizedBox(),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
