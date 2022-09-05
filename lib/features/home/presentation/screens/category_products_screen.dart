import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/features/home/presentation/cubit/category_cubit/categories_cubit.dart';
import 'package:supermarket/features/home/presentation/cubit/category_cubit/categories_states.dart';
import 'package:supermarket/features/home/presentation/widgets/product_loading_widgets/product_loading_card.dart';
import 'package:supermarket/features/home/presentation/widgets/product_widgets/product_card.dart';

class CategoryProductScreen extends StatelessWidget {
  const CategoryProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(),
            body: BlocConsumer<CategoriesCubit, CategoriesStates>(
              listener: (context, state) {
                if (state is GetCategoryProductsSuccessState) {
                  BlocProvider.of<CategoriesCubit>(context).categoryProducts =
                      state.categoryDetailsModel;
                }
              },
              builder: (context, state) {
                if (BlocProvider.of<CategoriesCubit>(context).categoryProducts?.data?.categoryProducts != null)
                {
                  return GridView.builder(
                    shrinkWrap: false,
                    itemCount: BlocProvider.of<CategoriesCubit>(context)
                        .categoryProducts
                        ?.data
                        ?.categoryProducts
                        ?.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 260, crossAxisCount: 2),
                    itemBuilder: (BuildContext context, index) {
                      return ProductCard(
                        inFavScreen: false,
                          productModel:
                              BlocProvider.of<CategoriesCubit>(context)
                                  .categoryProducts
                                  ?.data
                                  ?.categoryProducts?[index]);
                    },
                  );
                }
                else if (BlocProvider.of<CategoriesCubit>(context).categoryProducts?.data?.categoryProducts == null)
                {
                  return GridView.builder(
                    shrinkWrap: false,
                    itemCount: 6,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 270, crossAxisCount: 2),
                    itemBuilder: (BuildContext context, index) {
                      return const ProductLoadingCard();
                    },
                  );

                }
               return GridView.builder(
                  shrinkWrap: false,
                 itemCount: 6,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 270, crossAxisCount: 2),
                  itemBuilder: (BuildContext context, index) {
                    return const ProductLoadingCard();
                  },
                );
              },
            )));
  }
}
