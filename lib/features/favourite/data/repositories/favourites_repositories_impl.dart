import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/exceptions.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/core/network/network_info.dart';
import 'package:supermarket/features/favourite/data/datasource/favourites_data_source.dart';
import 'package:supermarket/features/favourite/data/models/add_or_remove_model.dart';
import 'package:supermarket/features/favourite/data/models/favourite_model.dart';
import 'package:supermarket/features/favourite/domain/repositories/favourite_repository.dart';

class FavouritesRepositoryImpl implements FavouriteRepository {
  final NetworkInfo networkInfo;
  final FavouritesDataSource favouritesDataSource;

  FavouritesRepositoryImpl(
      {required this.favouritesDataSource,
        required this.networkInfo,});

  @override
  Future<Either<Failure, FavoritesModel>> getUserFavourites({required String? token})async {
    try {
      final favourites = await favouritesDataSource.getUserFavourites(token: token);
      return Right(favourites);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AddOrRemoveFavouritesModel>> addOrRemoveFavourite({required String? token, required int productId})async {
    try {
      final favourites = await favouritesDataSource.addOrRemoveFavourite(token: token,productId: productId);
      return Right(favourites);
    } on ServerException {
      return Left(ServerFailure());
    }
  }


}
