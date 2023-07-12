import 'package:flutter/material.dart';

final List<String> coins = ["bitcoin"];
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
  const CoinDropDown({super.key});

  @override
  State<CoinDropDown> createState() => _CoinDropDownState();
}

class _CoinDropDownState extends State<CoinDropDown> {
  String? _dropDownValue = coins.first;

  void _dropDownCallback(String? newValue) {
    setState(() {
      _dropDownValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      items: _coinDropdownItems,
      value: _dropDownValue,
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
