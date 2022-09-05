
import 'package:supermarket/features/home/data/models/banner_model.dart';
import 'package:supermarket/features/home/data/models/product_model.dart';
import 'package:supermarket/features/home/domain/entities/home.dart';

class HomeDataModel extends HomeData{
  const HomeDataModel({
   required List<BannerModel> banners,
    required List<ProductModel> products,
    required String ad,
  }):super(ad: ad,banners: banners,products: products);

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => HomeDataModel(
    banners: List<BannerModel>.from(json["banners"].map((x) => BannerModel.fromJson(x))),
    products: List<ProductModel>.from(json["products"].map((x) => ProductModel.fromJson(x))),
    ad: json["ad"],
  );

  Map<String, dynamic> toJson() => {
    "banners": List<dynamic>.from(banners!.map((x) => x.toJson())),
    "products": List<dynamic>.from(products!.map((x) => x.toJson())),
    "ad": ad,
  };
}