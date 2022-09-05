// To parse this JSON data, do
//
//     final categoryDetailsPageModel = categoryDetailsPageModelFromJson(jsonString);

import 'dart:convert';

import 'package:supermarket/features/home/data/models/category_models/categories_data_model.dart';


CategoryDetailsModel categoryDetailsPageModelFromJson(String str) => CategoryDetailsModel.fromJson(json.decode(str));

String categoryDetailsPageModelToJson(CategoryDetailsModel data) => json.encode(data.toJson());

class CategoryDetailsModel {
  CategoryDetailsModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  dynamic message;
  CategoriesDataModel ?data;

  factory CategoryDetailsModel.fromJson(Map<String, dynamic> json) => CategoryDetailsModel(
    status: json["status"],
    message: json["message"],
    data: CategoriesDataModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJsonD(),
  };
}

