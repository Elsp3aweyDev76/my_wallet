// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:my_wallet/core/networking/fire_base_function.dart';
// import 'package:my_wallet/features/auth/logic/authcubit/auth_cubit.dart';
// import 'package:my_wallet/features/auth/login/login_page.dart';
// import 'package:my_wallet/features/auth/login/widgets/forget_password.dart';
// import 'package:my_wallet/features/auth/signUp/sign_up.dart';
// import 'package:my_wallet/features/home/home_page_view.dart';

// // constants of screens
// const kLoginView = '/';
// const kSignUpView = '/SignUp';
// const kForgetPasswordView = '/forgetPassword';
// const kHomeView = '/home';
// final router = GoRouter(
//   routes: [
//     GoRoute(
//       path: kLoginView,
//       builder: (context, state) => BlocProvider(
//         create: (context) => AuthCubit(FireBaseFunction()),
//         child: LoginPage(),
//       ),
//     ),
//     GoRoute(
//       path: kForgetPasswordView,
//       builder: (context, state) => const ForgetPassword(),
//     ),
//     GoRoute(path: kHomeView, builder: (context, state) => const HomePageView()),
//     GoRoute(
//       path: kSignUpView,
//       builder: (context, state) => BlocProvider(
//         create: (context) => AuthCubit(FireBaseFunction()),
//         child: SignUp(),
//       ),
//     ),
//   ],
// );
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_wallet/core/networking/fire_base_function.dart';
import 'package:my_wallet/features/auth/logic/authcubit/auth_cubit.dart';
import 'package:my_wallet/features/auth/login/widgets/forget_password.dart';
import 'package:my_wallet/features/auth/signUp/sign_up.dart';
import 'package:my_wallet/features/home/home_page_view.dart';
import 'package:my_wallet/features/login/login_screen.dart';

// constants of screens
const kLoginView = '/';
const kSignUpView = '/SignUp';
const kForgetPasswordView = '/forgetPassword';
const kHomeView = '/home';

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
          builder: (context, state) => const HomePageView()
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
