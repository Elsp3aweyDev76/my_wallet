import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_wallet/core/networking/fire_base_function.dart';
import 'package:my_wallet/features/auth/logic/auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  final FireBaseFunction fireBaseFunction;

  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AuthCubit(this.fireBaseFunction) : super(AuthcubitInitialState());

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    // بدلاً من الحالة الابتدائية، يفضل إرسال حالة تدل على التغيير أو إعادة إرسال الحالة الحالية
    if (!isClosed) emit(AuthcubitInitialState());
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    if (!isClosed) emit(AuthcubitInitialState());
  }

  Future<void> login() async {
    emit(AuthcubitLoadingState());
    try {
      final user = await fireBaseFunction.loginUser(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      // حماية: التأكد أن الكيوبيت مازال يعمل قبل إرسال النجاح أو الفشل
      // if (isClosed) return;

      if (user != null) {
        emit(AuthcubitSuccessState());
      } else {
        emit(AuthcubitFailureState('Login failed. Please try again.'));
      }
    } catch (e) {
      if (isClosed) return;
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

      // حماية: التأكد أن الكيوبيت مازال يعمل
      if (isClosed) return;

      if (user != null) {
        emit(AuthcubitSuccessState());
      } else {
        emit(AuthcubitFailureState('Signup failed. Please try again.'));
      }
    } catch (e) {
      if (isClosed) return;
      emit(AuthcubitFailureState(e.toString()));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
