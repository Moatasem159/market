import 'package:supermarket/features/cart/domain/entities/cart_item.dart';
import 'package:supermarket/features/home/data/models/product_model.dart';
import 'package:supermarket/features/home/domain/entities/product.dart';

class CartItemModel extends CartItem{


  CartItemModel({
    required int ?id,
   required int ?quantity,
    required Product? product,
}):super(id: id,product: product,quantity: quantity);



  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
    id: json["id"],
    quantity: json["quantity"],
    product: ProductModel.fromJson(json["product"]),
  );



}