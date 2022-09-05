import 'dart:convert';

import 'package:supermarket/features/profile/data/models/address_data_model.dart';


AddressModel addressPageFromJson(String str) => AddressModel.fromJson(json.decode(str));

String favoritesPageToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel{

  bool ?status;
  dynamic message;
 List<AddressDataModel>? addresses;

  AddressModel({this.status, this.message, this.addresses});

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    status: json["status"]??'',
    message: json["message"]??'',
    addresses: List<AddressDataModel>.from(json["data"].map((x) => AddressDataModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data":addresses,
  };
}