import 'package:supermarket/features/home/data/models/product_model.dart';

class SearchDataModel {
  SearchDataModel({

    this.data,

  });


  List<ProductModel>? data;


  factory SearchDataModel.fromJson(Map<String, dynamic> json) => SearchDataModel(

    data: List<ProductModel>.from(json["data"].map((x) => ProductModel.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {

    "data": List<dynamic>.from(data!.map((x) => x.toJson())),

     };
}