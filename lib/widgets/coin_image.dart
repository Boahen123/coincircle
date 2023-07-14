import 'package:flutter/material.dart';
import 'package:coincircle/widgets/details.dart';

Widget coinImag(
    {required String imgUrl,
    required double deviceWidth,
    required double deviceHeight,
    required BuildContext context}) {
  return GestureDetector(
    onDoubleTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const DetailsPage()));
    },
    child: Container(
      height: deviceHeight * 0.15,
      width: deviceWidth * 0.15,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imgUrl),
        ),
      ),
    ),
  );
}
