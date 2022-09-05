// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

import 'dart:convert';

import 'package:supermarket/features/search/data/models/search_data_model.dart';

SearchModel searchFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    this.status,
    this.message,
    this.data,
  });

  bool ?status;
  dynamic message;
  SearchDataModel ?data;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    status: json["status"],
    message: json["message"],
    data: SearchDataModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}