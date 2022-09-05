import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/favourite/data/models/add_or_remove_model.dart';
import 'package:supermarket/features/favourite/data/models/favourite_model.dart';


abstract class FavouriteRepository{

  Future<Either<Failure,FavoritesModel>> getUserFavourites({required String ?token});
  Future<Either<Failure,AddOrRemoveFavouritesModel>> addOrRemoveFavourite({required String ?token,required int productId});



}