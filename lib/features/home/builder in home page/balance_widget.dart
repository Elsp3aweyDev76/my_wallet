import 'package:flutter/material.dart';
import 'package:my_wallet/core/constants/constants.dart';
import 'package:my_wallet/core/constants/styles.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColors.kCardNavy,
      decoration: BoxDecoration(
        color: AppColors.kCardNavy,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(
        vertical: AppConstants.knumberOfPadding,
        horizontal: AppConstants.knumberOfPadding,
      ),
      height: 100,
      width: double.infinity,
      // color: AppColors.kCardNavy,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "the Balance",
                style: Styles.textStyleBold20.copyWith(
                  fontFamily: AppFonts.kCairoFont,
                ),
              ),
              Text(
                "1000.EGP",
                style: Styles.textStyleRegular20.copyWith(
                  fontFamily: AppFonts.kCairoFont,
                  fontSize: 25,
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.kCayanColor,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add, size: AppConstants.kSizeOfIcons),
            ),
          ),
        ],
      ),
    );
  }
}
