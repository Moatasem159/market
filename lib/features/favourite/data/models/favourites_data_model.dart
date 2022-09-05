
import 'package:supermarket/features/favourite/data/models/favourite_data_model.dart';

class FavoritesDataModel{
  FavoritesDataModel({
    this.data,
  });

  List<FavouriteDataModel> ?data;


  factory FavoritesDataModel.fromJson(Map<String, dynamic> json) =>FavoritesDataModel (
    data: List<FavouriteDataModel>.from(json["data"].map((x) => FavouriteDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}