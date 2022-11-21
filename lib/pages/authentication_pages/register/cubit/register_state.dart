part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final String error;
  RegisterErrorState({required this.error});
}

