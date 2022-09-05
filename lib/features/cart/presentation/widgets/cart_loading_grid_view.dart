import 'package:flutter/material.dart';
import 'package:supermarket/features/home/presentation/widgets/product_loading_widgets/product_loading_card.dart';

class CartLoadingGridView extends StatelessWidget {
  const CartLoadingGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, index) {
        return const ProductLoadingCard();
      },
    );
  }
}
