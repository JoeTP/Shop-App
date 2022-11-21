import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/home_screen.dart';
import 'package:shop_app/models/change_favorite_model.dart';
import 'package:shop_app/models/favorite_model.dart';
import 'package:shop_app/models/get_category.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/models/user_model.dart';
import 'package:shop_app/network/end_point.dart';
import 'package:shop_app/network/local/cache_helper.dart';
import 'package:shop_app/network/remote/dio_helper.dart';
import 'package:shop_app/pages/bnb_screens/browse_sc.dart';
import 'package:shop_app/pages/bnb_screens/category_sc.dart';
import 'package:shop_app/pages/bnb_screens/favorites_sc.dart';

import '../config/variables.dart';

part 'state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

//+drawer
  bool darkModeSwitch = true;

  void changeDarkModeSwitch({bool? v}) {
    if (v != null) darkModeSwitch = !v;
    CacheHelper.saveData(key: 'isDark', value: v!)
        .then((value) => emit(AppSwitchDarkModeState()));
  }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//+ screens
  int bnbCurrentIndex = 0;
  List<BottomNavigationBarItem> bnbItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border), label: 'Favorite'),
  ];
  List<Widget> screens = [BrowseScreen(), CategoryScreen(), FavoriteScreen()];

  void changeBNBIndex(int index) {
    bnbCurrentIndex = index;
    emit(AppChangeBNBState());
  }

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //+data
  HomeModel? homeModel;
  Map<int, bool> favorites = {};

  void getHomeData() {
    emit(AppLoadHomeDataState());
    DioHelper.getData(url: HOME, token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel!.data!.products.forEach((element) {
        favorites.addAll({element.id!: element.inFavorites!});
      });
      // print(favorites);
      emit(AppGetHomeDataSuccessState());
    }).catchError((e) {
      print('####HOME DATA##### ${e.toString()}');
      emit(AppGetHomeDataErrorState());
    });
  }

  CatModel? catModelData;

  void getCategories() {
    DioHelper.getData(
      url: GET_CATEGORY,
    ).then((value) {
      catModelData = CatModel.fromJson(value.data);
      // print(catModelData!.status);
      emit(AppGetCatDataSuccessState());
    }).catchError((e) {
      print('####CAT DATA##### ${e.toString()}');
      emit(AppGetCatSectionDataErrorState());
    });
  }

  ChangeFavoriteModel? changeFavoriteModel;

  void changeFavoriteItem(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(AppChangeFavoriteState());

    DioHelper.postData(
      url: FAVORITES,
      data: {"product_id": productId},
      token: token,
    ).then((value) {
      changeFavoriteModel = ChangeFavoriteModel.fromJson(value.data);
      if (!changeFavoriteModel!.status!) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavorites();
      }

      emit(AppChangeFavoriteSuccessState(changeFavoriteModel!));
    }).catchError((e) {
      print('####FAV DATA##### ${e.toString()}');
      favorites[productId] = !favorites[productId]!;

      emit(AppChangeFavoriteErrorState());
    });
  }

  FavoriteModel? favoriteModel;

  void getFavorites() {
    emit(AppLoadingFavoriteDataSuccessState());
    DioHelper.getData(url: FAVORITES, token: token).then((value) {
      favoriteModel = FavoriteModel.fromJson(value.data);
      // print(catModelData!.status);
      emit(AppGetFavoriteDataSuccessState());
    }).catchError((e) {
      print('####CAT DATA##### ${e.toString()}');
      emit(AppGetFavoriteDataErrorState());
    });
  }

  UserModel? userModel;

  void getUser() {
    DioHelper.getData(url: PROFILE, token: token).then((value) {
      userModel = UserModel.fromJson(value.data);
      // print(catModelData!.status);
      emit(AppGetUserDataSuccessState());
    }).catchError((e) {
      print('####USER DATA##### ${e.toString()}');
      emit(AppGetUserDataErrorState());
    });
  }

  void updateUser({
    required String name,
    required String phone,
    required String email,
  }) {
    emit(AppLoadingUpdateUserDataSuccessState());

    DioHelper.putData(url: UPDATE_PROFILE, token: token, data: {
      'name': name,
      'phone': phone,
      'email': email,
    }).then((value) {
      userModel = UserModel.fromJson(value.data);
      print(userModel!.data!.name!);
      emit(AppUpdateUserDataSuccessState());
    }).catchError((e) {
      print('####USER DATA##### ${e.toString()}');
      emit(AppUpdateUserDataErrorState());
    });
  }

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //+navigator
  void navigate(context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }

  void navigateAndFinish(context, Widget widget) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => false);
  }

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //+functions
//+ sign out
  void signOut(context, Widget widget) {
    CacheHelper.removeData(key: 'token').then((value) {
      if (value!) {
        AppCubit.get(context).navigateAndFinish(context, widget);
      }
    });
  }
}
