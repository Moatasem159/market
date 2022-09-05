

import 'package:supermarket/features/cart/data/models/cart_data_model.dart';

class CartModel {
  CartModel({
    this.status,
    this.message,
    this.data,
  });

  bool ?status;
  dynamic message;
  CartDataModel ?data;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    status: json["status"],
    message: json["message"],
    data: CartDataModel.fromJson(json["data"]??[]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}


class AddOrRemoveCartModel{

  bool ?status;
  dynamic message;

  AddOrRemoveCartModel({this.status, this.message});

  factory AddOrRemoveCartModel.fromJson(Map<String, dynamic> json) => AddOrRemoveCartModel(
    status: json["status"],
    message: json["message"]
  );
  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}