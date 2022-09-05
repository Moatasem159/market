import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/core/utils/app_strings.dart';
import 'package:supermarket/features/favourite/data/models/add_or_remove_model.dart';
import 'package:supermarket/features/favourite/data/models/favourite_model.dart';
import 'package:supermarket/features/favourite/domain/usecases/add_or_remove_favourite_use_case.dart';
import 'package:supermarket/features/favourite/domain/usecases/get_user_favourites_use_case.dart';
import 'package:supermarket/features/favourite/presentation/cubit/favourites_states.dart';

class FavouritesCubit extends Cubit<FavouriteStates> {
  FavouritesCubit(
      {required this.getUserFavouritesUseCase,
      required this.addOrRemoveFavouriteUseCase})
      : super(FavouritesInitialState());

  GetUserFavouritesUseCase getUserFavouritesUseCase;
  AddOrRemoveFavouriteUseCase addOrRemoveFavouriteUseCase;

  FavoritesModel? favoritesModel;

  Future<void> getUserFavourites() async {
    emit(GetUserFavouritesLoadingState());
    Either<Failure, FavoritesModel> response =
        await getUserFavouritesUseCase.call(token: AppStrings.userToken);

    response.fold((failure) {
      emit(GetUserFavouritesErrorState(msg: _mapFailureToMsg(failure)));
    }, (favourites) {
      for (var element in favourites.favoritesDataModel!.data!) {
        if (!favProducts.contains(element.productData.id)) {
          favProducts.add(element.productData.id!);
        }
      }
      favoritesModel = favourites;
      emit(GetUserFavouritesSuccessState(favoritesModel: favourites));
    });
  }

  List<int> favProducts = [];

  Future<void> addOrRemoveFavourite({required int? productId, required context}) async {
    emit(AddOrRemoveFavouriteLoadingState());
    if (favProducts.contains(productId!)) {
      favProducts.remove(productId);
    }
    else if (!favProducts.contains(productId)){
      favProducts.add(productId);
    }

    Either<Failure, AddOrRemoveFavouritesModel> response =
        await addOrRemoveFavouriteUseCase.call(
            token: AppStrings.userToken, productId: productId);
    response.fold((failure) {
      emit(AddOrRemoveFavouriteErrorState(msg: _mapFailureToMsg(failure)));
    }, (done){
      getUserFavourites();
      emit(AddOrRemoveFavouriteSuccessState(favoritesModel: done));
    });
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Server Failure";
      case CacheFailure:
        return "Cache Failure";
      default:
        return " error";
    }
  }
}
