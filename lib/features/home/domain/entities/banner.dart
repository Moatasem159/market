import 'package:equatable/equatable.dart';

class ApiBanner extends Equatable{

  const ApiBanner({
    this.id,
    this.image,
    this.category,
    this.product,
  });

  final int ?id;
  final String? image;
  final dynamic category;
  final dynamic product;
  @override
  List<Object?> get props => [image,id,category,product];

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "category": category,
    "product": product,
  };
}