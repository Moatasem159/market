
import 'package:supermarket/features/home/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required int id,
    required dynamic price,
    required dynamic oldPrice,
    required dynamic discount,
    required String image,
    required String name,
    required String description,
    required List<String>?images,
    required bool inFavorites,
    required bool inCart,}):super(
          name: name,
          id: id,
          price: price,
          oldPrice: oldPrice,
          discount: discount,
          image: image,
          images: images,
          description: description,
    inCart: inCart,
    inFavorites: inFavorites
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"]??0,
    price: json["price"]==null?0:json["price"].toDouble(),
    oldPrice: json["old_price"]==null?0:json["old_price"].toDouble(),
    discount: json["discount"]??0,
    image: json["image"]??'',
    name: json["name"]??'',
    description: json["description"]??'',
    images: json["images"]==null?[]:List<String>.from(json["images"].map((x) => x)),
    inFavorites: json["in_favorites"]??false,
    inCart: json["in_cart"]??false,
      );
}
