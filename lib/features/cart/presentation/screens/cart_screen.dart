import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/core/widgets/network_error_widget.dart';
import 'package:supermarket/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:supermarket/features/cart/presentation/cubit/cart_cubit/cart_states.dart';
import 'package:supermarket/features/cart/presentation/widgets/cart_grid_view.dart';
import 'package:supermarket/features/cart/presentation/widgets/cart_list_empty_widget.dart';
import 'package:supermarket/features/cart/presentation/widgets/cart_loading_grid_view.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartStates>(
      listener: (context, state) {
        if (state is AddOrRemoveFromCartSuccessState){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.msg),duration: const Duration(milliseconds: 1200),));
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              if (state is GetCartLoadingState&&BlocProvider.of<CartCubit>(context).cartModel?.data?.cartItems==null)
                const CartLoadingGridView(),
                if (BlocProvider.of<CartCubit>(context).cartModel?.data?.cartItems! !=null&&BlocProvider.of<CartCubit>(context).cartModel!.data!.cartItems!.isNotEmpty)
                  Column(
                    children: [
                      CartGridView(
                          cart: BlocProvider.of<CartCubit>(context)
                              .cartModel
                              ?.data!
                              .cartItems),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                          color: Theme.of(context).primaryColorLight,
                        ))),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Row(
                                children: [
                                  const Text(
                                    "SubTotal",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${BlocProvider.of<CartCubit>(context).cartModel?.data?.cartItems?.length ?? 0} Items",
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  const Spacer(),
                                  Text(
                                      "EGP ${BlocProvider.of<CartCubit>(context).cartModel?.data?.subTotal ?? ''}",
                                      style: const TextStyle(fontSize: 20)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Row(
                                children: [
                                  const Text(
                                    "Total",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const Spacer(),
                                  Text(
                                      "EGP ${BlocProvider.of<CartCubit>(context).cartModel?.data?.total ?? ''}",
                                      style: const TextStyle(fontSize: 20)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              if (BlocProvider.of<CartCubit>(context).cartModel?.data?.cartItems != null&&BlocProvider.of<CartCubit>(context).cartModel!.data!.cartItems!.isEmpty)
                const CartListEmpty(),
              if (state is GetCartErrorState&&BlocProvider.of<CartCubit>(context).cartModel?.data?.cartItems ==null)
                NetworkErrorWidget(
                    onRetryPressed:
                        BlocProvider.of<CartCubit>(context).getCart),
            ],
          ),
        );
      },
    );
  }
}
