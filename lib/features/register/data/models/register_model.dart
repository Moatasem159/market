// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

import 'package:supermarket/features/register/domain/entities/user_register.dart';



RegisterDataModel registerFromJson(String str) =>
    RegisterDataModel.fromJson(json.decode(str));

String registerToJson(RegisterDataModel data) => json.encode(data.toJson());

class RegisterDataModel {
  RegisterDataModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  RDataModel data;

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) =>
      RegisterDataModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? const RDataModel(
                name: '',
                email: '',
                phone: '',
                id: 0,
                image: "",
                token: "")
            : RDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class RDataModel extends UserRegister {


  const RDataModel(
      {required String name,
        required String email,
        required String phone,
        required int id,
        required String image,
        required String token
      }):super(name: name,phone: phone,email: email,id: id,image: image,token: token);



  factory RDataModel.fromJson(Map<String, dynamic> json) =>
      RDataModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        id: json["id"],
        image: json["image"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() =>
      {
        "name": name,
        "email": email,
        "phone": phone,
        "id": id,
        "image": image,
        "token": token,
      };
}