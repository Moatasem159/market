import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/features/home/presentation/cubit/category_cubit/categories_cubit.dart';
import 'package:supermarket/features/home/presentation/cubit/category_cubit/categories_states.dart';
import 'package:supermarket/features/home/presentation/widgets/category_loading_widgets/category_loading_list.dart';
import 'package:supermarket/features/home/presentation/widgets/category_widgets/category_card.dart';

class CategoryList extends StatelessWidget {
   const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit,CategoriesStates>(builder: (context, state) {

      if(BlocProvider.of<CategoriesCubit>(context).category?.data?.data!=null) {
        return SizedBox(
        height: 80,
        child: ListView.builder(
          itemCount: BlocProvider.of<CategoriesCubit>(context).category?.data?.data?.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              CategoryCard(categoryDataModel: BlocProvider.of<CategoriesCubit>(context).category?.data?.data?[index]),
        ),
      );
      }
      else if(BlocProvider.of<CategoriesCubit>(context).category==null||state is GetCategoriesLoadingState)
        {
          return const CategoryLoadingList();
        }
      return const CategoryLoadingList();
    },);
  }
}
