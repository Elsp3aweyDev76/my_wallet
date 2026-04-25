import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_wallet/core/services/validator.dart';
import 'package:my_wallet/core/utils/custom_text_field.dart';
import 'package:my_wallet/features/auth/logic/authcubit/auth_cubit.dart';
import 'package:my_wallet/features/auth/logic/authcubit/auth_cubit_state.dart';

class TextFieldsAuth {
  // for Name
  static Widget nameField({required BuildContext context}) {
    return CustomTextFormField(
      suffixIcon: const Icon(Icons.person_outline),
      colorOfFill: Theme.of(context).cardColor,
      filled: true,
      theHintText: "Name",
      thelabel: "Name",
      textType: TextInputType.name,
    );
  }

  // for Email
  static Widget emailField({
    required BuildContext context,
    required AuthCubit authCubit,
  }) {
    return CustomTextFormField(
      controller: authCubit.emailController,
      validator: Validator.validateEmail,
      suffixIcon: const Icon(Icons.email_outlined),
      // نستخدم الـ CardColor أو Surface ليكون متوافقاً مع الثيم
      colorOfFill: Theme.of(context).cardColor,
      filled: true,
      theHintText: "Enter your email",
      thelabel: "Email",
      textType: TextInputType.emailAddress,
    );
  }

  // for Password
  static Widget passwordField({
    required BuildContext context,
    required AuthCubit authCubit,
  }) {
    return BlocBuilder<AuthCubit, AuthCubitState>(
      builder: (context, state) {
        return CustomTextFormField(
          controller: authCubit.passwordController,
          validator: Validator.validatePassword,
          obscureText: authCubit.isPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              authCubit.isPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: () {
              authCubit.togglePasswordVisibility();
            },
          ),
          colorOfFill: Theme.of(context).cardColor,
          filled: true,
          textType: TextInputType.visiblePassword,
          theHintText: "Enter your password",
          thelabel: "Password",
        );
      },
    );
  }

  // for Confirm Password
  static Widget confirmPasswordField({
    required BuildContext context,
    required AuthCubit authCubit,
  }) {
    return BlocBuilder<AuthCubit, AuthCubitState>(
      builder: (context, state) {
        return CustomTextFormField(
          controller: authCubit.confirmPasswordController,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Please confirm your password';
            }
            if (value != authCubit.passwordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
          obscureText: authCubit.isConfirmPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              authCubit.isConfirmPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
            ),
            onPressed: authCubit.toggleConfirmPasswordVisibility,
          ),
          colorOfFill: Theme.of(context).cardColor,
          filled: true,
          textType: TextInputType.visiblePassword,
          theHintText: "Confirm your password",
          thelabel: "Confirm Password",
        );
      },
    );
  }
}
