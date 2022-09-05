// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

import 'package:supermarket/features/home/data/models/home_data_model.dart';


HomeModel homemodelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homemodelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    this.status,
    this.message,
    this.data,
  });

  bool ?status;
  dynamic message;
  HomeDataModel? data;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    status: json["status"],
    message: json["message"],
    data: HomeDataModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}