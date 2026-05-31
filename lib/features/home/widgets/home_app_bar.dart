import 'package:flutter/material.dart';
import 'package:my_wallet/core/constants/constants.dart';
import 'package:my_wallet/core/constants/styles.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        IconButton(
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero, // التحكم في الـ Padding هنا
            minimumSize: Size.zero, // إلغاء الحد الأدنى للحجم
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {},

          icon: Icon(Icons.menu, size: AppConstants.kSizeOfIcons),
        ),
        Text("My Wallet", style: Styles.textStyleBold20),

        IconButton(
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {},
          icon: Icon(Icons.notifications, size: AppConstants.kSizeOfIcons),
        ),
      ],
    );
  }
}
