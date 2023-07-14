import 'package:flutter/material.dart';
import 'package:html/parser.dart';

/// Widget to display the coin description
Widget description(
    String description, double? deviceHeight, double? deviceWidth) {
  var document = parse(description);
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: const Color.fromRGBO(83, 88, 206, 0.5),
    ),
    height: deviceHeight! * 0.45,
    width: deviceWidth! * 0.90,
    margin: EdgeInsets.symmetric(
      vertical: deviceHeight * 0.05,
    ),
    padding: EdgeInsets.symmetric(
        vertical: deviceHeight * 0.01, horizontal: deviceHeight * 0.01),
    child: Scrollbar(
      thumbVisibility: true,
      trackVisibility: true,
      child: SingleChildScrollView(
          child: Text(
        document.body!.text,
        style: const TextStyle(color: Colors.white),
      )),
    ),
  );
}
