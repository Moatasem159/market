

import 'package:supermarket/features/cart/domain/entities/cart_item.dart';

class Cart {
  Cart({
    required this.cartItems,
    required this.subTotal,
   required this.total,
  });

  List<CartItem>? cartItems;
  dynamic subTotal;
  dynamic total;
}