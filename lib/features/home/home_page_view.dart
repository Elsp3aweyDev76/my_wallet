import 'package:flutter/material.dart';
import 'package:my_wallet/features/home/home_page_view_body.dart';
import 'package:my_wallet/features/home/widgets/build_drawer.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: HomePageViewBody(),
      drawer: BuildDrawer(),
    );
  }
}
