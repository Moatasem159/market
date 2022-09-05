

import 'package:supermarket/features/favourite/domain/entities/favourite.dart';
import 'package:supermarket/features/home/data/models/product_model.dart';

class FavouriteDataModel extends Favourite {
  const FavouriteDataModel({
    required int id,
    required  ProductModel productFavoritesData,
  }):super(id: id,productData: productFavoritesData);



  factory FavouriteDataModel.fromJson(Map<String, dynamic> json) => FavouriteDataModel(
    id: json["id"],
    productFavoritesData:ProductModel.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product":ProductModel,
  };
}