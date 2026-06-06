import 'package:flutter/material.dart';
import 'package:my_wallet/features/views/home/builder%20in%20home%20page/color_of_backgroud.dart';
import 'package:my_wallet/features/views/wallet_view/widgets/flow_cahrt.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(gradient: colorOfBackgroud()),
          child: Center(child: BarChartSample2()),
          // body: SafeArea(child: Text("wallet view")),
        ),
      ),
    );
  }
}
