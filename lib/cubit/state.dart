part of 'cubit.dart';

@immutable
abstract class AppState {}

class AppInitialState extends AppState {}

class AppChangeBNBState extends AppState {}

class AppSwitchDarkModeState extends AppState {}

//+homeData
class AppLoadHomeDataState extends AppState {}

class AppGetHomeDataSuccessState extends AppState {}

class AppGetHomeDataErrorState extends AppState {}

//+cat
class AppGetCatDataSuccessState extends AppState {}

class AppGetCatSectionDataErrorState extends AppState {}

//+fav
class AppLoadingFavoriteDataSuccessState extends AppState {}

class AppGetFavoriteDataSuccessState extends AppState {}

class AppGetFavoriteDataErrorState extends AppState {}

class AppChangeFavoriteState extends AppState {}

class AppChangeFavoriteSuccessState extends AppState {
  ChangeFavoriteModel model;

  AppChangeFavoriteSuccessState(this.model);
}

class AppChangeFavoriteErrorState extends AppState {}

//+user data
class AppGetUserDataSuccessState extends AppState {}

class AppGetUserDataErrorState extends AppState {}

class AppLoadingUpdateUserDataSuccessState extends AppState {}

class AppUpdateUserDataSuccessState extends AppState {}

class AppUpdateUserDataErrorState extends AppState {}
