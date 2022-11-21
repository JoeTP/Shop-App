import 'package:flutter/material.dart';
import 'package:shop_app/config/text_styles/text_styles.dart';
import 'package:shop_app/config/variables.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/functions/used_functions.dart';
import 'package:shop_app/home_screen.dart';
import 'package:shop_app/network/local/cache_helper.dart';
import 'package:shop_app/pages/authentication_pages/login/cubit/login_cubit.dart';
import 'package:shop_app/pages/authentication_pages/register/register_screen.dart';
import 'package:shop_app/widgets/reusable/custom_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status!) {
              CacheHelper.saveData(key: 'token', value: state.loginModel.data!.token).then((value) {
                token = state.loginModel.data!.token;
                AppCubit.get(context).navigateAndFinish(context, Home());
              });
              Fluttertoast.showToast(
                msg: state.loginModel.message!,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
              );
            } else {
              print(state.loginModel.message);
              Fluttertoast.showToast(
                msg: state.loginModel.message!,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
              );
            }
          }
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TitleText(
                            text: 'Login',
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                        SizedBox(height: 15),
                        DefaultFormField(
                          validate: (v) {
                            if (v.isEmpty) {
                              return 'enter email';
                            }
                            return null;
                          },
                          controller: emailController,
                          hintText: 'email',
                        ),
                        SizedBox(height: 10),
                        DefaultFormField(
                          onSubmit: (v) {
                            if (formKey.currentState!.validate()) {
                              cubit.userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          validate: (v) {
                            if (v.isEmpty) {
                              return 'enter password';
                            }
                            return null;
                          },
                          controller: passwordController,
                          hintText: 'password',
                          isPassword: cubit.showPass,
                          suffix: cubit.showPassIcon,
                          pressSuffix: () {
                            cubit.seePassword();
                          },
                        ),
                        SizedBox(height: 10),
                        // Conditional.single(
                        //   context: context,
                        //   conditionBuilder: (context) =>
                        //       state is! LoginLoadingState,
                        //   widgetBuilder: (context) => ElevatedButton(
                        //       onPressed: () {
                        //         if (formKey.currentState!.validate()) {
                        //           cubit.userLogin(
                        //             email: emailController.text,
                        //             password: passwordController.text,
                        //           );
                        //         }
                        //       },
                        //       child: Text('LOGIN')),
                        //   fallbackBuilder: (context) =>
                        //       Center(child: CircularProgressIndicator()),
                        // ),
                        if(state is! LoginLoadingState)...[
                          ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              child: Text('LOGIN'))
                        ]else ...[

                          Center(child: CircularProgressIndicator())
                        ],
                        Row(
                          children: [
                            Text('Don\'t have an account?'),
                            TextButton(
                              onPressed: () {
                                AppCubit.get(context)
                                    .navigate(context, ShopRegister());
                              },
                              child: Text('REGISTER'),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
