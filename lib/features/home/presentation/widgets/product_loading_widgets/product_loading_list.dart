import 'package:flutter/material.dart';
import 'package:supermarket/features/home/presentation/widgets/product_loading_widgets/product_loading_card.dart';


class ProductLoadingList extends StatelessWidget {
  const ProductLoadingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>const ProductLoadingCard()),
    );
  }
}
