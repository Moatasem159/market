import 'package:supermarket/core/api/api_consumer.dart';
import 'package:supermarket/core/api/end_points.dart';
import 'package:supermarket/features/favourite/data/models/add_or_remove_model.dart';
import 'package:supermarket/features/favourite/data/models/favourite_model.dart';

abstract class FavouritesDataSource{
  Future<FavoritesModel> getUserFavourites({required String ?token});
  Future<AddOrRemoveFavouritesModel> addOrRemoveFavourite({required String ?token,required int ?productId});
}


class FavouritesDataSourceImpl implements FavouritesDataSource{
  ApiConsumer apiConsumer;
  FavouritesDataSourceImpl({required this.apiConsumer});


  @override
  Future<FavoritesModel> getUserFavourites({required String ?token}) async{
    final response=await apiConsumer.get(EndPoints.favourites,token:token);
    return FavoritesModel.fromJson(response);
  }

  @override
  Future<AddOrRemoveFavouritesModel> addOrRemoveFavourite({required String? token, required int? productId})async {
    final response=await apiConsumer.post(EndPoints.favourites,token:token,
        body: {
      "product_id":"$productId"
    });
    return AddOrRemoveFavouritesModel.fromJson(response);
  }





}