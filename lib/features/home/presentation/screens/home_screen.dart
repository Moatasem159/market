import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:supermarket/features/favourite/presentation/cubit/favourites_cubit.dart';
import 'package:supermarket/features/home/presentation/cubit/category_cubit/categories_cubit.dart';
import 'package:supermarket/features/home/presentation/cubit/category_cubit/categories_states.dart';
import 'package:supermarket/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:supermarket/features/home/presentation/cubit/home_cubit/home_states.dart';
import 'package:supermarket/features/home/presentation/widgets/banners_widgets/banners_slider_widget.dart';
import 'package:supermarket/features/home/presentation/widgets/category_widgets/category_list.dart';
import 'package:supermarket/features/home/presentation/widgets/product_widgets/product_list.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Column(
          children:  [
            const SizedBox(height: 10,),
            BlocConsumer<CategoriesCubit,CategoriesStates>(
              listener: (context, state) {
                if(state is GetCategoriesSuccessState)
                {
                  BlocProvider.of<CategoriesCubit>(context).category=state.categoryModel;

                }
              },
              builder: (context, state) {
                return const CategoryList();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                color: Colors.grey.withOpacity(.8),
                width: MediaQuery.of(context).size.width,
                height: 5,
              ),
            ),
            BlocConsumer<HomeCubit,HomeStates>(
              listener: (context, state) {
                if(state is GetHomeSuccessState)
                {
                  BlocProvider.of<HomeCubit>(context).homeModel=state.homeModel;
                  for (var product in BlocProvider.of<HomeCubit>(context).homeModel!.data!.products!) {
                    if(product.inFavorites)
                    {
                      BlocProvider.of<FavouritesCubit>(context).favProducts.add(product.id!);
                    }
                    if(product.inCart)
                    {
                        BlocProvider.of<CartCubit>(context).cartProducts.add(product.id!);
                    }
                  }
                }
              },
              builder: (context, state) {
                return Column(
                  children:  [
                    const BannersSlider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        color: Colors.grey.withOpacity(.8),
                        width: MediaQuery.of(context).size.width,
                        height: 5,
                      ),
                    ),
                    const ProductList(),
                  ],
                );
              },
            ),
                  ],
        ),
    );
  }
}
