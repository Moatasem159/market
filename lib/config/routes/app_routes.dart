import 'package:flutter/material.dart';
import 'package:supermarket/features/home/presentation/screens/category_products_screen.dart';
import 'package:supermarket/features/home/presentation/screens/main_screen.dart';
import 'package:supermarket/features/login/presentation/screens/login_screen.dart';
import 'package:supermarket/features/menu/presentation/screens/theme_screen.dart';
import 'package:supermarket/features/profile/presentation/screens/profile_screen.dart';
import 'package:supermarket/features/register/presentation/screens/register_screen.dart';
import 'package:supermarket/features/search/presentation/screens/search_screen.dart';
import 'package:supermarket/features/splash/presentation/screens/splash_screen.dart';
import 'package:supermarket/features/welcome/presentation/screens/welcome_screen.dart';

class Routes {

  static const String initialRoute= "/";
  static const String welcomeScreenRoute= "/welcomeScreen";
  static const String mainScreenRoute= "/mainScreen";
  static const String registerScreenRoute= "/registerScreen";
  static const String loginScreenRoute= "/loginScreen";
  static const String homeScreenRoute= "/homeScreen";
  static const String themeScreenRoute= "/themeScreen";
  static const String categoryProductsScreenRoute= "/categoryProductsScreen";
  static const String profileScreenRoute= "/profileScreen";
  static const String searchScreenRoute= "/searchScreen";

}



class AppRoute{


  static Route ? onGenerateRoute(RouteSettings routeSettings){

    switch(routeSettings.name){
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.welcomeScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        );
      case Routes.mainScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const MainScreen(),
        );
      case Routes.registerScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        );
      case Routes.loginScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case Routes.homeScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const MainScreen(),
        );
      case Routes.themeScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const ThemeScreen(),
        );
      case Routes.categoryProductsScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const CategoryProductScreen(),
        );
      case Routes.profileScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      case Routes.searchScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const SearchScreen(),
        );
      default: undefinedRoute();
    }
    return null;
  }


  static Route<dynamic> undefinedRoute(){
    return MaterialPageRoute(builder: (context) => const Scaffold(),);
  }



}