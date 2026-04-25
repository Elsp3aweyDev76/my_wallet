// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_wallet/core/networking/fire_base_function.dart';
// import 'package:my_wallet/features/auth/logic/authcubit/auth_cubit_state.dart';

// class AuthCubitLogin extends Cubit<AuthCubitState> {
//   final FireBaseFunction fireBaseFunction;
//   bool isPasswordVisible = true;
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   AuthCubitLogin(this.fireBaseFunction) : super(AuthcubitInitialState());
//   Future<void> login(String email, String password) async {
//     emit(AuthcubitLoadingState());
//     try {
//       final user = await fireBaseFunction.loginUser(
//         emailController.text.trim(),
//         passwordController.text.trim(),
//       );
//       if (user != null) {
//         emit(AuthcubitSuccessState());
//       } else {
//         emit(AuthcubitFailureState('Login failed. Please try again.'));
//       }
//     } catch (e) {
//       emit(AuthcubitFailureState(e.toString()));
//     }
//   }
// }
///////////////////////////////////
library;

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_wallet/core/networking/fire_base_function.dart';
import 'package:my_wallet/features/auth/logic/auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  final FireBaseFunction fireBaseFunction;

  // المتغيرات الخاصة بالتحكم في الواجهة
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController(); // أضف هذا السطر
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AuthCubit(this.fireBaseFunction) : super(AuthcubitInitialState());

  // الوظيفة الجديدة لتغيير حالة رؤية كلمة المرور
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    // نرسل الحالة الابتدائية مجدداً لإجبار الـ UI على إعادة البناء
    emit(AuthcubitInitialState());
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(AuthcubitInitialState());
  }

  Future<void> login() async {
    emit(AuthcubitLoadingState());
    try {
      final user = await fireBaseFunction.loginUser(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (user != null) {
        emit(AuthcubitSuccessState());
      } else {
        emit(AuthcubitFailureState('Login failed. Please try again.'));
      }
    } catch (e) {
      emit(AuthcubitFailureState(e.toString()));
    }
  }

  Future<void> signup() async {
    emit(AuthcubitLoadingState());
    try {
      final user = await fireBaseFunction.signUpUser(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      if (user != null) {
        emit(AuthcubitSuccessState());
      } else {
        emit(AuthcubitFailureState('Signup failed. Please try again.'));
      }
    } catch (e) {
      emit(AuthcubitFailureState(e.toString()));
    }
  }

  // ممارسة جيدة: إغلاق الـ Controllers عند تدمير الـ Cubit
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
