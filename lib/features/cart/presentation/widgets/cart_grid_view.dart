import 'package:flutter/widgets.dart';
import 'package:supermarket/features/cart/domain/entities/cart_item.dart';
import 'package:supermarket/features/cart/presentation/widgets/product_in_cart_card.dart';



class CartGridView extends StatelessWidget {
  const CartGridView({Key? key,required this.cart}) : super(key: key);

  final List<CartItem>? cart;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cart!.length,
      itemBuilder: (BuildContext context, index) {
        return ProductInCartCard(
          productModel:cart![index].product,quantity: cart![index].quantity,productId:cart![index].id);
      },
    );
  }
}
