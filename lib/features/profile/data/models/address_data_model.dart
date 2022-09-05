import 'package:supermarket/features/profile/domain/entities/address.dart';

class AddressDataModel extends Address {
  AddressDataModel({
    required int? id,
    required String? addressName,
    required String? city,
    required String? region,
    required String? details,
    required String? notes,
    required int? latitude,
    required int? longitude,
  }) : super(id: id,
            addressName: addressName,
            city: city,
            details: details,
            latitude: latitude,
            longitude: longitude,
            notes: notes,
            region: region);

  factory AddressDataModel.fromJson(Map<String, dynamic> json) => AddressDataModel(
    id: json["id"]??0,
    addressName: json["name"]??'',
    city: json["city"]??'',
    region: json["region"]??'',
    details: json["details"]??'',
    notes: json["notes"]??'',
    latitude: json["latitude"]??0,
    longitude: json["longitude"]??0,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": addressName,
    "city": city,
    "region": region,
    "details": details,
    "notes": notes,
    "latitude": latitude,
    "longitude":longitude,
  };
}
