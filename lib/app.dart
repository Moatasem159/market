import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:supermarket/features/search/presentation/cubits/search_cubit.dart';
import 'package:supermarket/injection_container.dart'as di;
import 'package:supermarket/config/routes/app_routes.dart';
import 'package:supermarket/config/themes/app_theme.dart';
import 'package:supermarket/config/themes/cubit/theme_cubit.dart';
import 'package:supermarket/config/themes/cubit/theme_state.dart';
import 'package:supermarket/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:supermarket/features/favourite/presentation/cubit/favourites_cubit.dart';
import 'package:supermarket/features/home/presentation/cubit/category_cubit/categories_cubit.dart';
import 'package:supermarket/features/home/presentation/cubit/home_cubit/home_cubit.dart';

class Market extends StatelessWidget {
  final bool ? isDark;
  const Market({Key? key, this.isDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>di.sl<ProfileCubit>()..getProfile()),
      BlocProvider(
        create: (context) => di.sl<SearchCubit>(),
      ),
      BlocProvider(create: (context) => di.sl<HomeCubit>()..getHomeData(context),),
      BlocProvider(create: (context) => di.sl<CategoriesCubit>()..getCategoriesData(),),
      BlocProvider(create: (context) => di.sl<FavouritesCubit>()),
      BlocProvider(create: (context) => di.sl<CartCubit>()),
      BlocProvider(create: (context) => di.sl<ThemeCubit>()..changeThemeMode(fromShared: isDark),),

    ], child: BlocBuilder<ThemeCubit,ThemesStates>(
      buildWhen: (previous, current) {
        return previous!=current;
      },
      builder: (context, state) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoute.onGenerateRoute,
        theme: AppTheme.lightTheme,
        themeMode:BlocProvider.of<ThemeCubit>(context).dark?ThemeMode.dark: ThemeMode.light,
        darkTheme: AppTheme.darkTheme,
      );
    },));
  }
}