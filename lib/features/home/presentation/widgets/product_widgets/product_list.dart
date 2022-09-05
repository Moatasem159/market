import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/features/favourite/presentation/cubit/favourites_cubit.dart';
import 'package:supermarket/features/favourite/presentation/cubit/favourites_states.dart';
import 'package:supermarket/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:supermarket/features/home/presentation/cubit/home_cubit/home_states.dart';
import 'package:supermarket/features/home/presentation/widgets/product_loading_widgets/product_loading_list.dart';
import 'package:supermarket/features/home/presentation/widgets/product_widgets/product_card.dart';


class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeStates>(
      builder: (context, state) {
      if(BlocProvider.of<HomeCubit>(context).homeModel?.data?.products!=null)
      {
        return BlocConsumer<FavouritesCubit,FavouriteStates>(
            listener: (context, state) {
              if (state is AddOrRemoveFavouriteSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.favoritesModel.message!)));
              }
            },
          builder: (context, state) {
            return SizedBox(
              height: 260,
              child: ListView.builder(
                  itemCount: BlocProvider.of<HomeCubit>(context)
                      .homeModel
                      ?.data
                      ?.products!
                      .length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ProductCard(
                    inFavScreen: false,
                      productModel: BlocProvider.of<HomeCubit>(context)
                          .homeModel
                          ?.data
                          ?.products![index]),
                ),
              );
          },
        );
      }
      else if(BlocProvider.of<HomeCubit>(context).homeModel?.data?.products==null||state is GetHomeLoadingState)
      {
        return const ProductLoadingList();
      }
      return const ProductLoadingList();
    },);
  }
}
