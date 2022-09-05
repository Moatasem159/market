
import 'package:supermarket/features/favourite/data/models/favourite_data_model.dart';

class AddOrRemoveFavouritesModel {
  bool ?status;
  String ?message;
  FavouriteDataModel? favouriteDataModel;

  AddOrRemoveFavouritesModel({
    this.status,
    this.message,
    this.favouriteDataModel
  });

  AddOrRemoveFavouritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    favouriteDataModel=FavouriteDataModel.fromJson(json['data']);
  }
}