import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wallet/core/constants/constants.dart';
import 'package:my_wallet/core/constants/styles.dart';
import 'package:my_wallet/core/routing/go_router.dart';
import 'package:my_wallet/core/utils/custom_button.dart';
import 'package:my_wallet/core/utils/custom_text_field.dart';

class LoginPageViewBody extends StatefulWidget {
  const LoginPageViewBody({super.key});

  @override
  State<LoginPageViewBody> createState() => _LoginPageViewBodyState();
}

class _LoginPageViewBodyState extends State<LoginPageViewBody> {
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    // نستخدم Theme.of للحصول على الألوان المتوافقة مع الـ Light/Dark Mode تلقائياً

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: knumberOfPadding),
      child: Column(
        spacing: 15,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Welcome back", style: Styles.textStyleRegular30)),
          const SizedBox(height: 20), // مسافة إضافية تحت العنوان

          CustomTextFormField(
            suffixIcon: const Icon(Icons.email_outlined),
            // نستخدم الـ CardColor أو Surface ليكون متوافقاً مع الثيم
            colorOfFill: Theme.of(context).cardColor,
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
                });
              },
            ),
            colorOfFill: Theme.of(context).cardColor,
            filled: true,
            textType: TextInputType.visiblePassword,
            theHintText: "Enter your password",
            thelabel: "Password",
          ),

          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(kForgetPasswordView);
              },
              child: Text("Forget Password?"),
            ),
            // ),
          ),

          // --- زر تسجيل الدخول الرئيسي ---
          CosutmButton(
            theColor: Constants.kPrimaryOrange,
            onTap: () {
              GoRouter.of(context).go(kHomeView);
              // نستخدم .go لكي لا يتمكن المستخدم من العودة لشاشة تسجيل الدخول بعد الدخول
            },
            title: 'Login',
          ),

          // --- فاصل "أو" (Divider) ---
          Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: Divider()),
              Text("OR", style: TextStyle(color: AppColors.greyColor)),
              const Expanded(child: Divider()),
            ],
          ),

          // --- زر تسجيل الدخول عبر جوجل ---
          OutlinedButton.icon(
            onPressed: () {
              // منطق تسجيل الدخول عبر جوجل سيوضع هنا لاحقاً
            },
            icon: const Icon(
              Icons.g_mobiledata,
              size: 30,
              color: Colors.red,
            ), // أيقونة تجريبية
            label: const Text("Continue with Google"),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.grey),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Dont have an account"),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(kSignUpView);
                },
                child: Text(
                  " SignUp",
                  style: TextStyle(color: Constants.kPrimaryOrange),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
