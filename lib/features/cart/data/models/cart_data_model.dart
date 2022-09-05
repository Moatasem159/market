

import 'package:supermarket/features/cart/data/models/cart_item_model.dart';
import 'package:supermarket/features/cart/domain/entities/cart.dart';
import 'package:supermarket/features/cart/domain/entities/cart_item.dart';

class CartDataModel extends Cart{
  CartDataModel({
  required super.cartItems,
  required super.subTotal,
  required super.total});




factory CartDataModel.fromJson(Map<String, dynamic> json) => CartDataModel(
cartItems:json["cart_items"]==null?[]:List<CartItem>.from(json["cart_items"].map((x) => CartItemModel.fromJson(x))),
subTotal: json["sub_total"]??0,
total: json["total"]??0,
);

Map<String, dynamic> toJson() => {
  "cart_items": List<dynamic>.from(cartItems!.map((x) => x.toJson())),
  "sub_total": subTotal,
  "total": total,
};
}