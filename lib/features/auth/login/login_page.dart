import 'package:flutter/material.dart';
import 'package:my_wallet/features/auth/login/login_page_view_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: LoginPageViewBody()));
  }
}
