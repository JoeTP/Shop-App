import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/network/end_point.dart';
import 'package:shop_app/network/remote/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  //+password
  bool showPass = true;
  IconData showPassIcon = Icons.visibility;

  void seePassword() {
    showPass =!showPass;
    showPass ? showPassIcon = Icons.visibility :  showPassIcon = Icons.visibility_off;
    emit(ShowPassState());
  }


  late LoginModel loginModel;
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {'email': email, 'password': password})
        .then((value)
    {
      print('PRINTING DATA### ${value.data}');
      loginModel = LoginModel.fromJson(value.data);
      // print('PRINTING DATA### ${loginModel.message}');
      emit(LoginSuccessState(loginModel));
    }).catchError((e){
      print('######LOGIN ERROR###### ${e.toString()}');
      emit(LoginErrorState(error: e.toString()));
    });
  }
}
