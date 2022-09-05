import 'package:flutter/widgets.dart';
import 'package:supermarket/features/home/data/models/product_model.dart';
import 'package:supermarket/features/home/presentation/widgets/product_widgets/product_card.dart';


class SearchGirdView extends StatelessWidget {
  const SearchGirdView({Key? key,required this.products}) : super(key: key);

  final List<ProductModel>? products;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: products!.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 270, crossAxisCount: 2),
        itemBuilder: (BuildContext context, index) {
          return ProductCard(
            inFavScreen: false,
            productModel: products![index],);
        },
      ),
    );
  }
}
