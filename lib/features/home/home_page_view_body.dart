import 'package:flutter/material.dart';
import 'package:my_wallet/features/home/builder%20in%20home%20page/body_oh_home.dart';
import 'package:my_wallet/features/home/builder%20in%20home%20page/color_of_backgroud.dart';

class HomePageViewBody extends StatelessWidget {
  const HomePageViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(gradient: colorOfBackgroud()),
      child: buildBodyOfHome(),
    );
  }


}
