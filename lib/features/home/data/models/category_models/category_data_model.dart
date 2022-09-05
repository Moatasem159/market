

import 'package:supermarket/features/home/domain/entities/category.dart';

class CategoryDataModel extends Category {
  const CategoryDataModel({
    required int ?id,
    required String? name,
    required String ?image,
  }):super(id: id,image: image,name: name);



  factory CategoryDataModel.fromJson(Map<String, dynamic> json) => CategoryDataModel(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}