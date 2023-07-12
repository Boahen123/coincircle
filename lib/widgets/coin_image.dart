import 'package:flutter/material.dart';

Widget coinImag(
    {required String imgUrl,
    required double deviceWidth,
    required double deviceHeight}) {
  return Container(
    height: deviceHeight * 0.15,
    width: deviceWidth * 0.15,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage(imgUrl),
      ),
    ),
  );
}
