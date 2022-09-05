import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:supermarket/core/utils/app_colors.dart';
import 'package:supermarket/core/widgets/buttons.dart';
import 'package:supermarket/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:supermarket/features/cart/presentation/cubit/cart_cubit/cart_states.dart';
import 'package:supermarket/features/home/domain/entities/product.dart';
import 'package:supermarket/features/home/presentation/widgets/product_screen_widgets/images_slider.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name!,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Stack(
              children: [
                ProductImagesSlider(images: product.images),
                if (product.discount != 0)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      alignment: Alignment.center,
                      width: 110,
                      height: 25,
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(25))),
                      child: Text(
                        "Discount ${product.discount}%",
                      ),
                    ),
                  )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Description :",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
                height: 150,
                child: ListView(padding: const EdgeInsets.all(10), children: [
                  Text(
                    product.description!,
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  )
                ])),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "price :",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  product.price.toString(),
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            if (product.discount != 0)
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Old Price :",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(
                    product.oldPrice.toString(),
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            BlocConsumer<CartCubit, CartStates>(
              listener: (context, state) {
                if (state is AddOrRemoveFromCartSuccessState){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.msg),duration: const Duration(milliseconds: 1200),));
                }
              },
              builder: (context, state) {
                if(state is AddOrRemoveFromCartLoadingState)
                  {
                    return Center(
                      child: SpinKitHourGlass(color: AppColors.primaryColor,),
                    );
                  }
                return Center(
                    child: MainButton(
                        onPressed: () {
                          if(!BlocProvider.of<CartCubit>(context)
                              .cartProducts
                              .contains(product.id)) {
                            BlocProvider.of<CartCubit>(context)
                              .addOrRemoveFromCart(
                              productId: product.id, context: context);
                          }
                        },
                        label: BlocProvider.of<CartCubit>(context)
                            .cartProducts
                            .contains(product.id)
                            ? "In cart"
                            : "Add to Cart")
                );

              },
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    ));
  }
}
