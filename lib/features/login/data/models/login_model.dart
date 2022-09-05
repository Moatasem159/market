// To parse this JSON data, do
//
//     final loginSuccessfully = loginSuccessfullyFromJson(jsonString);

import 'dart:convert';

import 'package:supermarket/features/login/domain/entities/user_login.dart';



UserModel loginSuccessfullyFromJson(String str) => UserModel.fromJson(json.decode(str));

String loginSuccessfullyToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
   this.status,
    this.message,
    this.data,
  });
  bool? status;
  String? message;
  UserDataModel? data;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    status: json["status"],
    message: json["message"]??'',
        data: json["data"] == null
            ? const UserDataModel(
                name: "",
                email: "",
                phone: "",
                id: 0,
                image: "",
                token: "",
                points: 0,
                credit: 0)
            : UserDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class UserDataModel extends User {

  const UserDataModel(
      {required String name,
        required String email,
        required String phone,
        required int id,
        required String image,
        required String token,
        required int points,
        required int credit,
      }):super(name: name,phone: phone,email: email,id: id,image: image,token: token,credit: credit,points: points);

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(

    id: json["id"],
    name: json["name"]??"",
    email: json["email"]??"",
    phone: json["phone"]??"",
    image: json["image"]??"",
    points: json["points"]??0,
    credit: json["credit"]??0,
    token: json["token"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "image": image,
    "points": points,
    "credit": credit,
    "token": token,
  };

}



