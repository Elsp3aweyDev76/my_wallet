import 'package:flutter/material.dart';
import 'package:my_wallet/core/constants/constants.dart';
import 'package:my_wallet/core/constants/styles.dart';

class LabelsTransactions extends StatelessWidget {
  const LabelsTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppConstants.knumberOfPadding8,
            ),
            child: Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.kblackColor,
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: AppConstants.knumberOfPadding16,
                      right: AppConstants.knumberOfPadding30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: AppConstants.knumberOfPadding8,
                          ),
                          child: Column(
                            spacing: 5,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "electricty",
                                style: AppStyles.textStyleMedium18,
                              ),

                              Text("30.june.2025"),
                            ],
                          ),
                        ),
                        Text("200 Egp"),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentGeometry.centerRight,
                    child: Container(
                      height: 70,
                      width: 20,
                      decoration: BoxDecoration(
                        color: AppColors.kAccentYellow,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(
                            AppConstants.knumberOfCirculer,
                          ),
                          bottomRight: Radius.circular(
                            AppConstants.knumberOfCirculer,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
