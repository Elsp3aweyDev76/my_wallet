import 'package:flutter/material.dart';
import 'package:my_wallet/core/constants/constants.dart';
import 'package:my_wallet/core/constants/styles.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TheCircularPercentIndicator extends StatelessWidget {
  const TheCircularPercentIndicator({
    super.key,
    required this.thePersent,
    required this.theProgressColler,
    required this.percentCircule,
    required this.theName,
  });
  final String thePersent, theName;
  final Color theProgressColler;
  final double percentCircule;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      arcType: ArcType.FULL,
      arcBackgroundColor: Colors.transparent,
      radius: 50.0,
      lineWidth: 12.0,
      percent: percentCircule,
      footer: Text(theName, style: Styles.textStyleRegular30),
      center: Text(
        thePersent,
        style: Styles.textStyleRegular20.copyWith(
          fontFamily: AppFonts.kCairoFont,
        ),
      ),
      progressColor: theProgressColler,
    );
  }
}
