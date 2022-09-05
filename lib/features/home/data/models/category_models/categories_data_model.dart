

import 'package:supermarket/features/home/data/models/category_models/category_data_model.dart';
import 'package:supermarket/features/home/data/models/product_model.dart';

class CategoriesDataModel {
  CategoriesDataModel({
     required this.data,
    this.categoryProducts,
  });


  List<CategoryDataModel> ?data;
  List<ProductModel> ?categoryProducts;


  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) => CategoriesDataModel(
    data: List<CategoryDataModel>.from(json["data"].map((x) => CategoryDataModel.fromJson(x))),
    categoryProducts:List<ProductModel>.from(json["data"].map((x) => ProductModel.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),

  };
  Map<String, dynamic> toJsonD() => {
    "data": List<dynamic>.from(categoryProducts!.map((x) => x.toJson())),
  };
}