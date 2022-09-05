
import 'package:supermarket/features/home/domain/entities/banner.dart';

class BannerModel extends ApiBanner {
  const BannerModel({
    required int id,
    required String image,
    required dynamic category,
    required dynamic product,
  }):super(image: image,id: id,category: category,product: product);


  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    id: json["id"],
    image: json["image"],
    category: json["category"],
    product: json["product"],
  );
}