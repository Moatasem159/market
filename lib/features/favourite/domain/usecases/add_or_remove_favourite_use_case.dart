import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/favourite/data/models/add_or_remove_model.dart';
import 'package:supermarket/features/favourite/domain/repositories/favourite_repository.dart';


class AddOrRemoveFavouriteUseCase{

  FavouriteRepository favouriteRepository;

  AddOrRemoveFavouriteUseCase({required this.favouriteRepository});



  Future<Either<Failure,AddOrRemoveFavouritesModel>> call({required String ?token,required int productId}){
    return favouriteRepository.addOrRemoveFavourite(token: token, productId: productId);
  }

}