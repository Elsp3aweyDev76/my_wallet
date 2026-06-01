import 'package:flutter/material.dart';
import 'package:my_wallet/features/home/widgets/circular_percent_indicator.dart';

class PersentsWidget extends StatelessWidget {
  const PersentsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TheCircularPercentIndicator(
          theName: "bills",
          percentCircule: 0.7,
          thePersent: "100",
          theProgressColler: Colors.red,
        ),
        TheCircularPercentIndicator(
          theName: "internet",
          percentCircule: 0.5,
          thePersent: "75",
          theProgressColler: Colors.blue,
        ),
        TheCircularPercentIndicator(
          theName: "wallet",
          percentCircule: 1,
          thePersent: "25",
          theProgressColler: Colors.green,
        ),
      ],
    );
  }
}
