import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/injection_container.dart'as di;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supermarket/app.dart';
import 'package:supermarket/bloc_observer.dart';
import 'package:supermarket/core/utils/app_strings.dart';
import 'package:supermarket/injection_container.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SharedPreferences sharedPreferences=sl<SharedPreferences>();
  AppStrings.userToken=sharedPreferences.getString(AppStrings.token);
  bool? isMainDark= sharedPreferences.getBool("dark");
  Bloc.observer=AppBlocObserver();
  runApp(Market(isDark: isMainDark,));
}



