abstract class AuthCubitState {}

class AuthcubitInitialState extends AuthCubitState {}

class AuthcubitLoadingState extends AuthCubitState {}

class AuthcubitSuccessState extends AuthCubitState {}

class AuthcubitFailureState extends AuthCubitState {
  final String errorMessage;

  AuthcubitFailureState(this.errorMessage);
}
