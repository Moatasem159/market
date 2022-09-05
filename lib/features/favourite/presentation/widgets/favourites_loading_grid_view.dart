import 'package:flutter/material.dart';
import 'package:supermarket/features/home/presentation/widgets/product_loading_widgets/product_loading_card.dart';

class FavouritesLoadingGridView extends StatelessWidget {
  const FavouritesLoadingGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 6,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 270, crossAxisCount: 2),
        itemBuilder: (BuildContext context, index) {
          return const ProductLoadingCard();
        },
      ),
    );
  }
}
