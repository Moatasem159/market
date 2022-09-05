import 'dart:convert';

import 'package:supermarket/features/logout/domain/entities/user_logout.dart';

LogoutModel logoutModelFromJson(String str) => LogoutModel.fromJson(json.decode(str));

String logoutModelToJson(LogoutModel data) => json.encode(data.toJson());

class LogoutModel {
  LogoutModel({
    this.status,
    this.message,
    this.data,
  });

  bool ?status;
  String ?message;
  LogoutDataModel ?data;

  factory LogoutModel.fromJson(Map<String, dynamic> json) => LogoutModel(
    status: json["status"],
    message: json["message"],
    data: LogoutDataModel.fromJson(json["data"]??[]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data!.toJson(),
  };
}

class LogoutDataModel extends UserLogout {

  const LogoutDataModel({
    required int id,
    required String? token}):super(id: id,token: token);

  factory LogoutDataModel.fromJson(Map<String, dynamic> json) => LogoutDataModel(
    id: json["id"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "token": token,
  };


}
