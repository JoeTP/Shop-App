part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  LoginModel loginModel;
  LoginSuccessState(this.loginModel);

}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState({required this.error});
}

class ShowPassState extends LoginState {}
