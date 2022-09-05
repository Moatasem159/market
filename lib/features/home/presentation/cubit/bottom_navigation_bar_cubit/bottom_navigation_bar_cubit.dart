import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supermarket/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:supermarket/features/cart/presentation/screens/cart_screen.dart';
import 'package:supermarket/features/favourite/presentation/cubit/favourites_cubit.dart';
import 'package:supermarket/features/favourite/presentation/screens/favourite_screen.dart';
import 'package:supermarket/features/home/presentation/cubit/bottom_navigation_bar_cubit/bottom_navigation_bar_states.dart';
import 'package:supermarket/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:supermarket/features/home/presentation/screens/home_screen.dart';
import 'package:supermarket/features/menu/presentation/screens/menu_screens.dart';

class BottomNavCubit extends Cubit<BottomNavStates>{
  BottomNavCubit() : super(BottomNavInitialState());

  int bottomNavIndex = 0;
  List<BottomNavigationBarItem> navigationItems =
  [
    const BottomNavigationBarItem(icon: Icon(Icons.explore), label: "home"),
    const BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "cart"),
    const BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.solidHeart,), label: "favorites"),
    const BottomNavigationBarItem(icon: Icon(Icons.menu), label: "menu"),
  ];

List<Widget> screens = [
  const HomeScreen(),
  const CartScreen(),
  const FavouriteScreen(),
  const MenuScreen(),


];



  void changeIndex(int index,BuildContext context){


    if(index==0)
      {
        BlocProvider.of<HomeCubit>(context).getHomeData(context);
      }
    if(index==1){
      BlocProvider.of<CartCubit>(context).getCart();
    }
    if(index==2){
      BlocProvider.of<FavouritesCubit>(context).getUserFavourites();
    }
    bottomNavIndex=index;
    emit(ChangeBottomNavState());
  }

}