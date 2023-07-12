import 'package:flutter/material.dart';

/// A widget to display the current price of a cryptocurrency in USD
Widget currentPrice(num rate) {
  return Text(
    "${rate.toStringAsFixed(2)} USD",
    style: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  );
}

/// A widget to display the percentage change of a cryptocurrency in USD
Widget percentageChanger(num change) {
  return Text(
    "${change.toStringAsFixed(2)}%",
    style: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
  );
}
