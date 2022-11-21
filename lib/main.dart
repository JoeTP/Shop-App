import 'package:flutter/material.dart';
import 'package:shop_app/config/theme/dark_theme.dart';
import 'package:shop_app/config/theme/light_theme.dart';
import 'package:shop_app/config/variables.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/functions/bloc_obs.dart';
import 'package:shop_app/home_screen.dart';
import 'package:shop_app/network/local/cache_helper.dart';
import 'package:shop_app/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/pages/authentication_pages/login/cubit/login_cubit.dart';
import 'package:shop_app/pages/authentication_pages/login/login_screen.dart';
import 'package:shop_app/pages/on_board%20screen.dart';
import 'package:get/get.dart';
import 'package:shop_app/widgets/gridview_product_item.dart';
import 'package:shop_app/widgets/reusable/product_item.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = (details) {
    return Container(
      color: Color(0xff00224b),
      alignment: Alignment.center,
      child: Text(
        "Error\n${details.exception}",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  };
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  // print('test 1');

  bool? isDark = CacheHelper.getData(key: 'isDark');
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  // print('test 2');

  token = CacheHelper.getData(key: 'token');
  // print('test 3');

  Widget? startingScreen;
  if (onBoarding != null) {
    if (token.isNotEmpty || token != null)
      startingScreen = Home();
    else
      startingScreen = LoginScreen();
  } else {
    startingScreen = OnBoardScreen();
  }
  // print('test 4');
  print('token is:$token');
  runApp(MyApp(
    isDark: isDark == null ? false : true,
    startingScreen: startingScreen,
  ));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  final Widget startingScreen;

  MyApp({super.key, required this.isDark, required this.startingScreen});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AppCubit()
              ..getHomeData()
              ..getCategories()
              ..getFavorites()..getUser(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return GetMaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: AppCubit.get(context).darkModeSwitch
                ? ThemeMode.dark
                : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: SafeArea(child: startingScreen),
          );
        },
      ),
    );
  }
}