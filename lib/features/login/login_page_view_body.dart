import 'package:flutter/material.dart';
import 'package:my_wallet/core/constants/styles.dart';
import 'package:my_wallet/core/utils/custom_text_field.dart';
import 'package:my_wallet/features/login/widget/forget_password.dart';

class LoginPageViewBody extends StatefulWidget {
  const LoginPageViewBody({super.key});

  @override
  State<LoginPageViewBody> createState() => _LoginPageViewBodyState();
}

class _LoginPageViewBodyState extends State<LoginPageViewBody> {
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("Welcome back", style: Styles.textStyleRegular30)),
        CustomTextFormField(
          suffixIcon: Icon(Icons.email_outlined),
          colorOfFill: Colors.grey.shade900,
          filled: true,
          theHintText: "Enter your email",
          thelabel: "Email",
          textType: TextInputType.emailAddress,
        ),
        CustomTextFormField(
          obscureText: isPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
                setState(() {});
              });
            },
          ),
          colorOfFill: Colors.grey.shade900,
          filled: true,
          textType: TextInputType.visiblePassword,
          theHintText: "Enter your password",
          thelabel: "Password",
        ),
        // ForgetPassword(),
        Align(
          alignment: AlignmentGeometry.centerRight,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ForgetPassword()),
              );
            },
            child: Text("Forget Password?"),
          ),
        ),
      ],
    );
  }
}
