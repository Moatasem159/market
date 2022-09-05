import 'package:equatable/equatable.dart';
import 'package:supermarket/features/favourite/data/models/add_or_remove_model.dart';
import 'package:supermarket/features/favourite/data/models/favourite_model.dart';


abstract class FavouriteStates extends Equatable{
  @override
  List<Object?> get props => [];
}




class FavouritesInitialState extends FavouriteStates{}
class GetUserFavouritesLoadingState extends FavouriteStates{}
class GetUserFavouritesSuccessState extends FavouriteStates{

  final FavoritesModel favoritesModel;

  GetUserFavouritesSuccessState({required this.favoritesModel});

  @override
  List<Object?> get props => [favoritesModel];


}
class GetUserFavouritesErrorState extends FavouriteStates{

  final String msg;

  GetUserFavouritesErrorState({required this.msg});

  @override
  List<Object>get props=>[msg];
}

class AddOrRemoveFavouriteLoadingState extends FavouriteStates{}
class AddOrRemoveFavouriteSuccessState extends FavouriteStates{

  final AddOrRemoveFavouritesModel favoritesModel;

  AddOrRemoveFavouriteSuccessState({required this.favoritesModel});

  @override
  List<Object?> get props => [favoritesModel];


}
class AddOrRemoveFavouriteErrorState extends FavouriteStates{

  final String msg;

  AddOrRemoveFavouriteErrorState({required this.msg});

  @override
  List<Object>get props=>[msg];
}