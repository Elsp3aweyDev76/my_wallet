import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wallet/core/constants/constants.dart';
import 'package:my_wallet/core/constants/styles.dart';
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
    final Color primaryColor = Theme.of(context).primaryColor;

    return Column(
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
          child: TextButton(
            onPressed: () {
              GoRouter.of(context).push(Constants.kForgetPasswordView);
            },
            child: const Text("Forget Password?"),
          ),
        ),

        const SizedBox(height: 10),

        // --- زر تسجيل الدخول الرئيسي ---
        SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go(Constants.kHomeView);
              // نستخدم .go لكي لا يتمكن المستخدم من العودة لشاشة تسجيل الدخول بعد الدخول
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Text(
              "Login",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),

        // --- فاصل "أو" (Divider) ---
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              Expanded(child: Divider()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("OR", style: TextStyle(color: Colors.grey)),
              ),
              Expanded(child: Divider()),
            ],
          ),
        ),

        // --- زر تسجيل الدخول عبر جوجل ---
        SizedBox(
          width: double.infinity,
          height: 55,
          child: OutlinedButton.icon(
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
        ),
      ],
    );
  }
}
