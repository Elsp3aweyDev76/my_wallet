import 'package:flutter/material.dart';
import 'package:my_wallet/core/constants/constants.dart';
import 'package:my_wallet/core/services/function_of_space.dart';
import 'package:my_wallet/features/home/builder%20in%20home%20page/balance_widget.dart';
import 'package:my_wallet/features/home/builder%20in%20home%20page/labels_transactions.dart';
import 'package:my_wallet/features/home/builder%20in%20home%20page/persents_widget.dart';
import 'package:my_wallet/features/home/builder%20in%20home%20page/top_expenses.dart';
import 'package:my_wallet/features/home/widgets/home_app_bar.dart';

SafeArea buildBodyOfHome() {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.knumberOfPadding16,
      ),
      // padding: kTabLabelPadding,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                verticalSpace(height: 20),
                HomeAppBar(),
                verticalSpace(height: 30),
                BalanceWidget(),
                verticalSpace(height: 15),
                AddressWidget(nameOfAddress: "Top Transactions"),
                verticalSpace(height: 15),
                PersentsWidget(),
                verticalSpace(height: 15),
                AddressWidget(nameOfAddress: "Latest Transactions"),
                verticalSpace(height: 15),
                LabelsTransactions(),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
