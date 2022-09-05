

import 'package:supermarket/features/home/domain/entities/product.dart';

class CartItem {
  CartItem({
    this.id,
    this.quantity,
    this.product,
  });

  int ?id;
  int ?quantity;
  Product? product;

  Map<String, dynamic> toJson() => {
    "id": id,
    "quantity": quantity,
    "product": product?.toJson(),
  };

}