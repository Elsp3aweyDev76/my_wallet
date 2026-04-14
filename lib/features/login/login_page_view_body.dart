import 'package:flutter/material.dart';
import 'package:my_wallet/core/constants/styles.dart';
import 'package:my_wallet/core/utils/custom_text_field.dart';

class LoginPageViewBody extends StatelessWidget {
  const LoginPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("Welcome back", style: Styles.textStyleRegular30)),
        CustomTextFormField(
          theHintText: "Enter your email",
          thelabel: "Email",
          textType: TextInputType.emailAddress,
        ),
        CustomTextFormField(
          textType: TextInputType.visiblePassword,
          theHintText: "Enter your password",
          thelabel: "Password",
        ),
      ],
    );
  }
}
