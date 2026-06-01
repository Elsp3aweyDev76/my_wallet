// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_wallet/core/constants/styles.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({super.key, required this.nameOfAddress});
  final String nameOfAddress;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.centerLeft,
      child: Text(nameOfAddress, style: AppStyles.textStyleBold20),
    );
  }
}
