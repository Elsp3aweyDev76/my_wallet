import 'package:flutter/material.dart';
import 'package:my_wallet/core/constants/constants.dart';
import 'package:my_wallet/core/constants/styles.dart';
import 'package:my_wallet/core/services/function_of_space.dart';
import 'package:my_wallet/features/home/widgets/home_app_bar.dart';

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
          colors: [AppColors.kredColor, AppColors.kCardNavy],
        ),
      ),
      child: SafeArea(
        child: Padding(
          // padding: const EdgeInsets.symmetric(horizontal: knumberOfPadding),
          padding: kTabLabelPadding,
          child: Column(
            children: [
              verticalSpace(height: 20),
              HomeAppBar(),
              verticalSpace(height: 30),
              Container(
                // color: AppColors.kCardNavy,
                decoration: BoxDecoration(
                  color: AppColors.kCardNavy,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: Constants.knumberOfPadding,
                  horizontal: Constants.knumberOfPadding,
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
                        icon: Icon(Icons.add, size: Constants.kSizeOfIcons),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
