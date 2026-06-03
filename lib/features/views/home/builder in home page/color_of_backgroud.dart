import 'package:flutter/material.dart';
import 'package:my_wallet/core/constants/constants.dart';

LinearGradient colorOfBackgroud() {
  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 0.5],
    colors: [AppColors.kredColor, AppColors.kCardNavy],
  );
}
