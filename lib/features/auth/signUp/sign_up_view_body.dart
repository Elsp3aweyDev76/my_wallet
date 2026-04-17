import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wallet/core/constants/constants.dart';
import 'package:my_wallet/core/routing/go_router.dart';
import 'package:my_wallet/core/utils/custom_text_field.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // لضمان عدم حدوث Overflow عند ظهور لوحة المفاتيح
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- العناوين ---
          const Text(
            "Create Account",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            "Start managing your wallet efficiently",
            style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
          ),

          const SizedBox(height: 40),

          // --- حقل الاسم الكامل ---
          _buildLabel("Full Name"),
          CustomTextFormField(
            suffixIcon: const Icon(Icons.person_outline),
            colorOfFill: Theme.of(context).cardColor,
            filled: true,
            theHintText: "John Doe",
            thelabel: "Name",
            textType: TextInputType.name,
          ),

          const SizedBox(height: 20),

          // --- حقل البريد الإلكتروني ---
          _buildLabel("Email Address"),
          CustomTextFormField(
            suffixIcon: const Icon(Icons.email_outlined),
            colorOfFill: Theme.of(context).cardColor,
            filled: true,
            theHintText: "example@mail.com",
            thelabel: "Email",
            textType: TextInputType.emailAddress,
          ),

          const SizedBox(height: 20),

          // --- حقل كلمة المرور ---
          _buildLabel("Password"),
          CustomTextFormField(
            obscureText: isPasswordHidden,
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordHidden ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () =>
                  setState(() => isPasswordHidden = !isPasswordHidden),
            ),
            colorOfFill: Theme.of(context).cardColor,
            filled: true,
            theHintText: "••••••••",
            thelabel: "Password",
            textType: TextInputType.visiblePassword,
          ),

          const SizedBox(height: 40),

          // --- زر إنشاء الحساب ---
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                // منطق إنشاء الحساب ثم التوجه للرئيسية
                GoRouter.of(context).go(kHomeView);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Constants.kPrimaryOrange,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: const Text(
                "Sign Up",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // --- العودة لتسجيل الدخول ---
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () =>
                      GoRouter.of(context).pop(), // العودة لشاشة الـ Login
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Constants.kPrimaryOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ويدجت صغير للعناوين الجانبية فوق الحقول
  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      ),
    );
  }
}
