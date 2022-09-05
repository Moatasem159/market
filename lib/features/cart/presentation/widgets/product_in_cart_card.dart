import 'package:buildcondition/buildcondition.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:supermarket/core/utils/app_colors.dart';
import 'package:supermarket/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:supermarket/features/favourite/presentation/cubit/favourites_cubit.dart';
import 'package:supermarket/features/favourite/presentation/cubit/favourites_states.dart';
import 'package:supermarket/features/home/domain/entities/product.dart';

class ProductInCartCard extends StatefulWidget {

  final Product? productModel;
  final int ?quantity;
  final int ?productId;

  const ProductInCartCard(
      {Key? key, required this.productModel, required this.quantity,required this.productId})
      : super(key: key);

  @override
  State<ProductInCartCard> createState() => _ProductInCartCardState();
}

class _ProductInCartCardState extends State<ProductInCartCard> {
  bool deleting=false;
  bool cartUpdating=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          SizedBox(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.productModel!.name!,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis
                              ),),
                            if(widget.productModel!.discount != 0)
                              Column(
                                children: [
                                  const SizedBox(height: 10,),
                                  Stack(
                                    children: [
                                      Text(
                                        "EGP ${widget.productModel!.oldPrice
                                            .toString()} ",
                                        style: const TextStyle(
                                            fontSize: 13
                                        ),
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
                            const SizedBox(height: 10,),
                            Text(
                              "EGP ${widget.productModel!.price.toString()}",
                              style: const TextStyle(
                                  fontSize: 18
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: CachedNetworkImage(
                                imageUrl: widget.productModel!.image!,
                                placeholder: (context, url) {
                                  return const Image(
                                    image: AssetImage(
                                        "assets/images/loading_image.jpg"),
                                  );
                                },
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 7),
                                child: BlocBuilder<
                                    FavouritesCubit,
                                    FavouriteStates>(
                                  builder: (context, state) {
                                    return IconButton(
                                        iconSize: 30,
                                        icon: Icon(
                                          BlocProvider
                                              .of<FavouritesCubit>(context)
                                              .favProducts
                                              .contains(widget.productModel!.id)
                                              ? Icons.favorite : Icons
                                              .favorite_border,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          BlocProvider.of<FavouritesCubit>(
                                              context)
                                              .addOrRemoveFavourite(
                                              productId: widget.productModel?.id,
                                              context: context);
                                        });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            deleting=true;
                          });
                          BlocProvider.of<CartCubit>(context)
                              .addOrRemoveFromCart(
                              productId: widget.productModel!.id, context: context).then((value){
                            setState(() {
                              deleting=false;
                            });
                          });
                        },
                        child: Row(children:[
                          const Icon(Icons.delete),
                          BuildCondition(
                            condition: !deleting,
                            builder: (context) {
                              return const Text("remove");
                            },
                            fallback: (context)=>SpinKitWave(color: AppColors.primaryColor,size: 15),
                          )
                        ],),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                cartUpdating=true;
                              });
                              BlocProvider.of<CartCubit>(context)
                                  .updateCart(
                                  id: widget.productModel!.id!,
                                quantity: widget.quantity!+1,
                                  productId: widget.productId, context: context).then((value){
                                    setState(() {
                                      cartUpdating=false;
                                    });
                              });
                            },
                            icon: const Icon(Icons.plus_one),
                            splashRadius: 15,
                          ),
                          BuildCondition(
                            condition:!cartUpdating,
                            builder: (context) {
                              return Container(
                                  alignment: Alignment.center,
                                  color: AppColors.primaryColor,
                                  width: 15,
                                  child: Text(widget.quantity.toString()));
                            },
                            fallback: (context)=>SpinKitWave(color: AppColors.primaryColor,size: 15),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                cartUpdating=true;
                              });
                              BlocProvider.of<CartCubit>(context)
                                  .updateCart(
                                  quantity: widget.quantity!-1,
                                  id: widget.productModel!.id!,
                                  productId: widget.productId, context: context).then((value){
                                setState(() {
                                  cartUpdating=false;
                                });
                              });
                            },
                            icon: const Icon(Icons.exposure_minus_1),
                            splashRadius: 15,
                          ),
                        ],
                      )


                    ],
                  )
                ],
              )
          ),
          const SizedBox(height: 5,),
          Container(
            width: 170,
            height: 1,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
