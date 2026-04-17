import 'package:go_router/go_router.dart';
import 'package:my_wallet/features/auth/login/login_page.dart';
import 'package:my_wallet/features/auth/login/widget/forget_password.dart';
import 'package:my_wallet/features/auth/signUp/sign_up.dart';
import 'package:my_wallet/features/home/home_page_view.dart';

// constants of screens
const kLoginView = '/';
const kSignUpView = '/SignUp';
const kForgetPasswordView = '/forgetPassword';
const kHomeView = '/home';
final router = GoRouter(
  routes: [
    GoRoute(path: kLoginView, builder: (context, state) => const LoginPage()),
    GoRoute(
      path: kForgetPasswordView,
      builder: (context, state) => const ForgetPassword(),
    ),
    GoRoute(path: kHomeView, builder: (context, state) => const HomePageView()),
    GoRoute(path: kSignUpView, builder: (context, state) => const SignUp()),
  ],
);
