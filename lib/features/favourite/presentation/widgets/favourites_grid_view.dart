import 'package:flutter/widgets.dart';
import 'package:supermarket/features/favourite/data/models/favourite_data_model.dart';
import 'package:supermarket/features/home/presentation/widgets/product_widgets/product_card.dart';


class FavouritesGridView extends StatelessWidget {
  const FavouritesGridView({Key? key,required this.favoriteProducts}) : super(key: key);

 final List<FavouriteDataModel>? favoriteProducts;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: favoriteProducts!.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 270, crossAxisCount: 2),
        itemBuilder: (BuildContext context, index) {
          return ProductCard(
            inFavScreen: true,
            productModel: favoriteProducts![index].productData,);
        },
      ),
    );
  }
}
