import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wallet/core/constants/constants.dart';
import 'package:my_wallet/core/routing/go_router.dart';
import 'package:my_wallet/core/services/function_of_space.dart';
import 'package:my_wallet/features/views/home/builder%20in%20home%20page/balance_widget.dart';
import 'package:my_wallet/features/views/home/builder%20in%20home%20page/labels_transactions.dart';
import 'package:my_wallet/features/views/home/builder%20in%20home%20page/persents_widget.dart';
import 'package:my_wallet/features/views/home/builder%20in%20home%20page/top_expenses.dart';
import 'package:my_wallet/features/views/home/widgets/home_app_bar.dart';

class BodyOhHome extends StatelessWidget {
  const BodyOhHome({super.key});
  @override
  Widget build(BuildContext context) {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AddressWidget(nameOfAddress: "Transactions"),
                      IconButton(
                        onPressed: () {
                          GoRouter.of(context).go(kTransationsView);
                        },

                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
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
}
