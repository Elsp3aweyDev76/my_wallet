import 'package:flutter/material.dart';
import 'package:my_wallet/core/constants/constants.dart';

class HomePageViewBody extends StatelessWidget {
  const HomePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 0.5],
          colors: [Constants.kredColor, Constants.kCardNavy],
        ),
      ),
      child: SafeArea(child: Column(children: [

        ],
      )),
    );
  }
}
