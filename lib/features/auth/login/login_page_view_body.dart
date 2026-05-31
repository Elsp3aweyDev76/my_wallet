import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wallet/core/constants/constants.dart';
import 'package:my_wallet/core/constants/styles.dart';
import 'package:my_wallet/core/routing/go_router.dart';
import 'package:my_wallet/core/utils/custom_button.dart';
import 'package:my_wallet/features/auth/logic/auth_cubit.dart';
import 'package:my_wallet/features/auth/login/widgets/text_fields_auth.dart';

class LoginPageViewBody extends StatelessWidget {
  const LoginPageViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    // نستخدم Theme.of للحصول على الألوان المتوافقة مع الـ Light/Dark Mode تلقائياً

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.knumberOfPadding),
      // padding: kTabLabelPadding,
      child: Form(
        key: authCubit.formKey,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Welcome back",
                      style: Styles.textStyleRegular30,
                    ),
                  ),
                  const SizedBox(height: 20), // مسافة إضافية تحت العنوان

                  TextFieldsAuth.emailField(
                    context: context,
                    authCubit: authCubit,
                  ),
                  TextFieldsAuth.passwordField(
                    context: context,
                    authCubit: authCubit,
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
                    theColor: AppColors.kPrimaryOrange,
                    onTap: () {
                      // if (authCubit.formKey.currentState!.validate()) {
                      //   authCubit.login();
                      //   // GoRouter.of(context).go(kHomeView);
                      // }
                      GoRouter.of(context).go(kHomeView);
                    },
                    title: 'Login',
                  ),

                  // --- (Divider) ---
                  Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(child: Divider()),
                      Text("OR", style: TextStyle(color: AppColors.kgreyColor)),
                      const Expanded(child: Divider()),
                    ],
                  ),

                  // --- زر تسجيل الدخول عبر جوجل ---
                  OutlinedButton.icon(
                    onPressed: () {},
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
                          style: TextStyle(color: AppColors.kPrimaryOrange),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
