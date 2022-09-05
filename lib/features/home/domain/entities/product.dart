import 'package:equatable/equatable.dart';

class Product extends Equatable{
  const Product({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.images,
    required this.inFavorites,
    required this.inCart,
  });
  final int? id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String? image;
  final String ?name;
  final String ?description;
  final List<String>? images;
  final bool inFavorites;
  final bool inCart;
  @override
  List<Object?> get props => [id,price,oldPrice,description,discount,image,name,inCart,inFavorites,images];

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "old_price": oldPrice,
    "discount": discount,
    "image": image,
    "name": name,
    "description": description,
    "images": List<dynamic>.from(images!.map((x) => x)),
    "in_favorites": inFavorites,
    "in_cart": inCart,
  };
}