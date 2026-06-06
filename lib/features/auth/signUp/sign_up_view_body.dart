import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wallet/core/constants/constants.dart';
import 'package:my_wallet/core/routing/go_router.dart';
import 'package:my_wallet/features/auth/logic/auth_cubit.dart';
import 'package:my_wallet/features/auth/login/widgets/text_fields_auth.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = context.read<AuthCubit>();
    return SingleChildScrollView(
      // لضمان عدم حدوث Overflow عند ظهور لوحة المفاتيح
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Form(
        key: authCubit.formKey,
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
            TextFieldsAuth.nameField(context: context),

            // --- حقل البريد الإلكتروني ---
            _buildLabel("Email Address"),
            TextFieldsAuth.emailField(authCubit: authCubit, context: context),

            // --- حقل كلمة المرور ---
            _buildLabel("Password"),
            TextFieldsAuth.passwordField(
              authCubit: authCubit,
              context: context,
            ),
            _buildLabel("Password"),
            TextFieldsAuth.confirmPasswordField(
              authCubit: authCubit,
              context: context,
            ),
            SizedBox(height: 10),
            // --- زر إنشاء الحساب ---
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  if (authCubit.formKey.currentState!.validate()) {
                    authCubit.signup();
                    GoRouter.of(context).go(kHomeView);
                  }
                  // منطق إنشاء الحساب ثم التوجه للرئيسية
                  // GoRouter.of(context).go(kHomeView);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kPrimaryOrange,
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
                        color: AppColors.kPrimaryOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
