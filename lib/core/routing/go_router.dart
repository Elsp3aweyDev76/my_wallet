import 'package:go_router/go_router.dart';
import 'package:my_wallet/core/constants/constants.dart';
import 'package:my_wallet/features/home/home_page_view.dart';
import 'package:my_wallet/features/login/login_page.dart';
import 'package:my_wallet/features/login/widget/forget_password.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: Constants.kLoginView,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: Constants.kForgetPasswordView,
      builder: (context, state) => const ForgetPassword(),
    ),
    GoRoute(
      path: Constants.kHomeView,
      builder: (context, state) => const HomePageView(),
    ),
  ],
);
