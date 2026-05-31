import 'package:flutter/material.dart';
import 'package:my_wallet/core/constants/constants.dart';
import 'package:my_wallet/core/constants/styles.dart';
import 'package:my_wallet/core/services/function_of_space.dart';
import 'package:my_wallet/features/home/builder%20in%20home%20page/balance_widget.dart';
import 'package:my_wallet/features/home/widgets/circular_percent_indicator.dart';
import 'package:my_wallet/features/home/widgets/home_app_bar.dart';

SafeArea buildBodyOfHome() {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.knumberOfPadding,
      ),
      // padding: kTabLabelPadding,
      child: Column(
        children: [
          verticalSpace(height: 20),
          HomeAppBar(),
          verticalSpace(height: 30),
          BalanceWidget(),
          verticalSpace(height: 15),
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Text("Top Expenses", style: Styles.textStyleBold20),
          ),
          verticalSpace(height: 15),
          Row(
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
          ),
        ],
      ),
    ),
  );
}
