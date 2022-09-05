import 'dart:convert';

import 'package:supermarket/features/favourite/data/models/favourites_data_model.dart';


FavoritesModel favoritesPageFromJson(String str) => FavoritesModel.fromJson(json.decode(str));

String favoritesPageToJson(FavoritesModel data) => json.encode(data.toJson());

class FavoritesModel {
  FavoritesModel({
    this.status,
    this.message,
    this.favoritesDataModel,
  });

  bool ?status;
  dynamic message;
  FavoritesDataModel? favoritesDataModel;


  factory FavoritesModel.fromJson(Map<String, dynamic> json) => FavoritesModel(
    status: json["status"]??'',
    message: json["message"]??'',
    favoritesDataModel:FavoritesDataModel.fromJson(json["data"]??[]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data":favoritesDataModel,
  };
}