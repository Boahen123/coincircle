import 'package:flutter/material.dart';
import 'package:coincircle/widgets/details.dart';

/// The coin image widget
Widget coinImag(
    {required String imgUrl,
    required double deviceWidth,
    required double deviceHeight,
    required BuildContext context,
    required Map currentPrices}) {
  return GestureDetector(
    onDoubleTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return DetailsPage(currentPrices);
      }));
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
