import 'package:flutter/material.dart';
import 'package:my_wallet/features/login/login_screen.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    // return const LoginScreen();
    return Scaffold(
      body: SafeArea(child: LoginPage()),
    );
  }
}
