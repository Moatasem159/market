import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/config/routes/app_routes.dart';
import 'package:supermarket/features/home/data/models/category_models/category_data_model.dart';
import 'package:supermarket/features/home/presentation/cubit/category_cubit/categories_cubit.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key,required this.categoryDataModel }) : super(key: key);

   final  CategoryDataModel ?categoryDataModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        BlocProvider.of<CategoriesCubit>(context).getCategoryProducts(categoryId: categoryDataModel?.id,context: context);
        Navigator.pushNamed(context, Routes.categoryProductsScreenRoute);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: 100,
          height: 100,
          child: Column(
            children: [
              Container(
                height: 50,
                decoration:  const BoxDecoration(
                ),
                child: CachedNetworkImage(
                    imageUrl:categoryDataModel!.image!,
                  height: 100,
                  width: 100,
                  placeholder: (context, url) {
                    return const Image(
                      image: AssetImage("assets/images/loading_image.jpg"),
                      height: 100,
                      width: 100,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
                  child:  Text(
                    categoryDataModel!.name!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
