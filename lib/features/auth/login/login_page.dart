import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wallet/core/routing/go_router.dart';
import 'package:my_wallet/features/auth/logic/auth_cubit.dart';
import 'package:my_wallet/features/auth/logic/auth_cubit_state.dart';
import 'package:my_wallet/features/auth/login/login_page_view_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<AuthCubit, AuthCubitState>(
          listener: (context, state) {
            if (state is AuthcubitSuccessState) {
              context.go(kHomeView);
            } else if (state is AuthcubitFailureState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          child: LoginPageViewBody(),
        ),
      ),
    );
  }
}
