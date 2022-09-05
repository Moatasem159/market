import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/favourite/data/models/favourite_model.dart';
import 'package:supermarket/features/favourite/domain/repositories/favourite_repository.dart';


class GetUserFavouritesUseCase{



  FavouriteRepository favouriteRepository;

  GetUserFavouritesUseCase({required this.favouriteRepository});

  Future<Either<Failure, FavoritesModel>> call({required String ?token})async{
    return favouriteRepository.getUserFavourites(token: token);
  }
}