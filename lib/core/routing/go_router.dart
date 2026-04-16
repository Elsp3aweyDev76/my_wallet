import 'package:go_router/go_router.dart';
import 'package:my_wallet/core/constants/constants.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: Constants.kLoginView,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: Constants.kForgetPasswordView,
      builder: (context, state) => const ForgetPasswordView(),
    ),
    GoRoute(
      path: Constants.kHomeView,
      builder: (context, state) => const HomeView(),
    ),
  ],
);
