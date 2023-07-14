import 'package:flutter/material.dart';

/// Page to display the different exchange rates of the coin
class DetailsPage extends StatelessWidget {
  final Map? currentPrices;
  const DetailsPage(this.currentPrices, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: currentPrices!.keys.length,
              itemBuilder: (context, index) {
                List<dynamic> keys = currentPrices!.keys.toList();
                List<dynamic> values = currentPrices!.values.toList();
                return ListTile(
                    title: Text(
                  '${keys[index].toString().toUpperCase()} : ${values[index].toString()}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ));
              }),
        ),
      ),
    );
  }
}
