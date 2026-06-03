import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wallet/core/networking/fire_base_function.dart';
import 'package:my_wallet/features/auth/logic/auth_cubit.dart';
import 'package:my_wallet/features/auth/login/login_page.dart';
import 'package:my_wallet/features/auth/login/widget/forget_password.dart';
import 'package:my_wallet/features/auth/signUp/sign_up.dart';
import 'package:my_wallet/features/views/home/home_page_view.dart';
import 'package:my_wallet/features/views/userView/user_view.dart';
import 'package:my_wallet/features/views/wallet_view/wallet_view.dart';

// constants of screens
const kLoginView = '/';
const kSignUpView = '/SignUp';
const kForgetPasswordView = '/forgetPassword';
const kHomeView = '/homeView';
const kUserView = '/userView';
const kWalletView = '/walletView';

class AppRouter {
  // نقوم بإنشاء الدالة التي تبني الـ Router وتحدد نقطة البداية
  static GoRouter createRouter(bool isLoggedIn) {
    return GoRouter(
      // تحديد المسار الابتدائي: إذا كان isLoggedIn يساوي true يذهب للهوم، وإلا يذهب للـ Login
      initialLocation: isLoggedIn ? kHomeView : kLoginView,
      routes: [
        GoRoute(
          path: kLoginView,
          builder: (context, state) => BlocProvider(
            create: (context) => AuthCubit(FireBaseFunction()),
            child: const LoginPage(),
          ),
        ),
        GoRoute(
          path: kForgetPasswordView,
          builder: (context, state) => const ForgetPassword(),
        ),
        GoRoute(
          path: kHomeView,
          builder: (context, state) => const HomePageView(),
        ),
        GoRoute(path: kUserView, builder: (context, state) => const UserView()),
        GoRoute(
          path: kWalletView,
          builder: (context, state) => const WalletView(),
        ),

        GoRoute(
          path: kSignUpView,
          builder: (context, state) => BlocProvider(
            create: (context) => AuthCubit(FireBaseFunction()),
            child: const SignUp(),
          ),
        ),
      ],
    );
  }
}
