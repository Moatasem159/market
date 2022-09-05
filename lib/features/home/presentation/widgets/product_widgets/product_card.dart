import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/features/favourite/presentation/cubit/favourites_cubit.dart';
import 'package:supermarket/features/home/domain/entities/product.dart';
import 'package:supermarket/features/home/presentation/screens/product_screen.dart';

class ProductCard extends StatelessWidget {
  final Product? productModel;

  final bool ?inFavScreen;

  const ProductCard({Key? key, required this.productModel, required this.inFavScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(!inFavScreen!)
          {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(product: productModel!)));
          }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: CachedNetworkImage(
                        imageUrl: productModel!.image!,
                        placeholder: (context, url) {
                          return const Image(
                            image: AssetImage("assets/images/loading_image.jpg"),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: IconButton(
                            iconSize: 30,
                            icon: Icon(
                              BlocProvider.of<FavouritesCubit>(context).favProducts.contains(productModel!.id)
                                  ? Icons.favorite : Icons.favorite_border,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              BlocProvider.of<FavouritesCubit>(context)
                                  .addOrRemoveFavourite(
                                  productId: productModel?.id,
                                  context: context);
                            })
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 7),
                child: Text(
                  productModel!.name!,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Column(
                  children: [
                    Text(
                      "${productModel!.price.toString()} EGP",
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if (productModel!.discount != 0)
                      Stack(
                        children: [
                          Text(
                            "${productModel!.oldPrice.toString()} EGP",
                            style: const TextStyle(color: Colors.black),
                          ),
                          Positioned(
                              top: 8,
                              child: Container(
                                color: Colors.grey,
                                width: 80,
                                height: 1,
                              ))
                        ],
                      ),
                  ],
                ),
              ),
              if (productModel!.discount != 0)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25))),
                    child: Text(
                      "Discount  ${productModel!.discount.toString()}%",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              const SizedBox(
                height: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
