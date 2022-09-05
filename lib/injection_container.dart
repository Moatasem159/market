import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supermarket/config/themes/cubit/theme_cubit.dart';
import 'package:supermarket/core/api/api_consumer.dart';
import 'package:supermarket/core/api/app_interceptors.dart';
import 'package:supermarket/core/api/dio_consumer.dart';
import 'package:supermarket/core/network/network_info.dart';
import 'package:supermarket/features/cart/data/datasource/cart_data_source.dart';
import 'package:supermarket/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:supermarket/features/cart/domain/repositories/cart_repository.dart';
import 'package:supermarket/features/cart/domain/usecases/add_or_remove_from_cart_use_case.dart';
import 'package:supermarket/features/cart/domain/usecases/get_user_cart_use_case.dart';
import 'package:supermarket/features/cart/domain/usecases/update_cart_use_case.dart';
import 'package:supermarket/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:supermarket/features/favourite/data/datasource/favourites_data_source.dart';
import 'package:supermarket/features/favourite/data/repositories/favourites_repositories_impl.dart';
import 'package:supermarket/features/favourite/domain/repositories/favourite_repository.dart';
import 'package:supermarket/features/favourite/domain/usecases/add_or_remove_favourite_use_case.dart';
import 'package:supermarket/features/favourite/domain/usecases/get_user_favourites_use_case.dart';
import 'package:supermarket/features/favourite/presentation/cubit/favourites_cubit.dart';
import 'package:supermarket/features/home/data/datasource/categories_data_source.dart';
import 'package:supermarket/features/home/data/datasource/home_data_source.dart';
import 'package:supermarket/features/home/data/repositories/category_repository_impl.dart';
import 'package:supermarket/features/home/data/repositories/home_repository_impl.dart';
import 'package:supermarket/features/home/domain/repositories/category_repository.dart';
import 'package:supermarket/features/home/domain/repositories/home_repository.dart';
import 'package:supermarket/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:supermarket/features/home/domain/usecases/get_home_usecase.dart';
import 'package:supermarket/features/home/domain/usecases/get_products_of_category_usecase.dart';
import 'package:supermarket/features/home/presentation/cubit/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:supermarket/features/home/presentation/cubit/category_cubit/categories_cubit.dart';
import 'package:supermarket/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:supermarket/features/login/data/datasource/login_data_source.dart';
import 'package:supermarket/features/login/data/repositories/login_repository_impl.dart';
import 'package:supermarket/features/login/domain/repositories/login_repository.dart';
import 'package:supermarket/features/login/domain/usecases/login.dart';
import 'package:supermarket/features/login/presentation/cubit/login_cubit.dart';
import 'package:supermarket/features/logout/data/data_sources/logout_data_source.dart';
import 'package:supermarket/features/logout/data/repositories/logout_repository_impl.dart';
import 'package:supermarket/features/logout/domain/repositories/logout_repository.dart';
import 'package:supermarket/features/logout/domain/usecases/logout_use_case.dart';
import 'package:supermarket/features/logout/presentation/cubits/logout_cubit.dart';
import 'package:supermarket/features/profile/data/data_sources/profile_data_source.dart';
import 'package:supermarket/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:supermarket/features/profile/domain/repositories/profile_repository.dart';
import 'package:supermarket/features/profile/domain/usecases/add_address_use_case.dart';
import 'package:supermarket/features/profile/domain/usecases/get_profile_use_case.dart';
import 'package:supermarket/features/profile/domain/usecases/get_user_addresses_use_case.dart';
import 'package:supermarket/features/profile/domain/usecases/update_user_data_use_case.dart';
import 'package:supermarket/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:supermarket/features/register/data/datasource/register_data_source.dart';
import 'package:supermarket/features/register/data/repositories/register_repository_impl.dart';
import 'package:supermarket/features/register/domain/repositories/register_repository.dart';
import 'package:supermarket/features/register/domain/usecases/register.dart';
import 'package:supermarket/features/register/presentation/cubit/register_cubit.dart';
import 'package:supermarket/features/search/data/data_sources/search_data_source.dart';
import 'package:supermarket/features/search/data/repositories/search_repository_impl.dart';
import 'package:supermarket/features/search/domain/repositories/search_repository.dart';
import 'package:supermarket/features/search/domain/usecases/search_use_case.dart';
import 'package:supermarket/features/search/presentation/cubits/search_cubit.dart';


final sl = GetIt.instance;

Future<void> init() async {
  ///features

  //blocs
  sl.registerFactory(() => ThemeCubit(sharedPreferences: sl()));
  sl.registerFactory(() => RegisterCubit(register: sl()));
  sl.registerFactory(() => LoginCubit(loginUseCase: sl(),sharedPreferences: sl()));
  sl.registerFactory<BottomNavCubit>(() => BottomNavCubit());
  sl.registerFactory<HomeCubit>(() => HomeCubit(getHomeUseCase: sl()));
  sl.registerFactory<CategoriesCubit>(() => CategoriesCubit(getCategoriesUseCase: sl(),getProductOfCategoryUseCase: sl()));
  sl.registerFactory<FavouritesCubit>(() => FavouritesCubit(getUserFavouritesUseCase: sl(),addOrRemoveFavouriteUseCase: sl()));
  sl.registerFactory<CartCubit>(() => CartCubit(getUserCartUseCase: sl(),addOrRemoveFromCartUseCase: sl(), updateCartUseCase: sl()));
  sl.registerFactory<LogoutCubit>(() => LogoutCubit(logoutUseCase: sl(),sharedPreferences: sl()));
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(
      getProfileUseCase: sl(),
      addAddressUseCase: sl(),
      getUserAddressesUseCase: sl(),
    updateUserDataUserCase: sl()
  ));
  sl.registerFactory<SearchCubit>(() => SearchCubit(searchUseCase: sl()));


  //useCases

  sl.registerLazySingleton<RegisterUseCase>(()=>RegisterUseCase(registerRepository: sl()));
  sl.registerLazySingleton<LoginUseCase>(()=>LoginUseCase(loginRepository: sl()));
  sl.registerLazySingleton<GetHomeUseCase>(()=>GetHomeUseCase(homeRepository: sl()));
  sl.registerLazySingleton<GetCategoriesUseCase>(()=>GetCategoriesUseCase(categoryRepository:sl()));
  sl.registerLazySingleton<GetProductOfCategoryUseCase>(()=>GetProductOfCategoryUseCase(categoryRepository:sl()));
  sl.registerLazySingleton<GetUserFavouritesUseCase>(()=>GetUserFavouritesUseCase(favouriteRepository: sl()));
  sl.registerLazySingleton<GetUserCartUseCase>(()=>GetUserCartUseCase(cartRepository: sl()));
  sl.registerLazySingleton<AddOrRemoveFavouriteUseCase>(()=>AddOrRemoveFavouriteUseCase(favouriteRepository: sl()));
  sl.registerLazySingleton<AddOrRemoveFromCartUseCase>(()=>AddOrRemoveFromCartUseCase(cartRepository:sl()));
  sl.registerLazySingleton<UpdateCartUseCase>(()=>UpdateCartUseCase(cartRepository:sl()));
  sl.registerLazySingleton<LogoutUseCase>(()=>LogoutUseCase(logoutRepository: sl(),));
  sl.registerLazySingleton<GetProfileUseCase>(()=>GetProfileUseCase(profileRepository: sl(),));
  sl.registerLazySingleton<SearchUseCase>(()=>SearchUseCase(searchRepository: sl(),));
  sl.registerLazySingleton<GetUserAddressesUseCase>(()=>GetUserAddressesUseCase(profileRepository: sl(),));
  sl.registerLazySingleton<AddAddressUseCase>(()=>AddAddressUseCase(profileRepository: sl(),));
  sl.registerLazySingleton<UpdateUserDataUserCase>(()=>UpdateUserDataUserCase(profileRepository: sl(),));




  // Repository

 sl.registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl(
    registerDataSource: sl(), networkInfo: sl()));
 sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(loginDataSource: sl(),networkInfo: sl()));
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
    homeDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<CategoryRepository>(() => CategoryRepositoryImpl(networkInfo: sl(), categoriesDataSource: sl()));
sl.registerLazySingleton<FavouriteRepository>(() => FavouritesRepositoryImpl(networkInfo: sl(),favouritesDataSource: sl()));
sl.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(networkInfo: sl(),cartDataSource: sl()));
sl.registerLazySingleton<LogoutRepository>(() => LogoutRepositoryImpl(networkInfo: sl(),logoutDataSource: sl()));
sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(networkInfo: sl(),profileDataSource: sl()));
sl.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl(networkInfo: sl(),searchDataSource: sl()));


  //dataSource

  sl.registerLazySingleton<RegisterDataSource>(() => RegisterDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<HomeDataSource>(() => HomeDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<CategoriesDataSource>(() => CategoriesDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<FavouritesDataSource>(() => FavouritesDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<CartDataSource>(() => CartDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<LogoutDataSource>(() => LogoutDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<ProfileDataSource>(() => ProfileDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<SearchDataSource>(() => SearchDataSourceImpl(apiConsumer: sl()));

  ///core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));

  ///External

  final sharedPreference = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreference);
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ));
}
