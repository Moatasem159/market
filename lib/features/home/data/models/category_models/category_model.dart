

import 'dart:convert';

import 'package:supermarket/features/home/data/models/category_models/categories_data_model.dart';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
     this.status,
    this.message,
     this.data,
  });

  bool? status;
  dynamic message;
  CategoriesDataModel ? data;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    status: json["status"],
    message: json["message"],
    data: CategoriesDataModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}