import 'package:flutter/material.dart';
import 'package:my_wallet/features/auth/signUp/sign_up_view_body.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpViewBody(),
      appBar: AppBar(title: Text("Sign Up ")),
    );
  }
}
