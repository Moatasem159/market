import 'package:equatable/equatable.dart';
import 'package:supermarket/features/home/data/models/category_models/category_details_model.dart';
import 'package:supermarket/features/home/data/models/category_models/category_model.dart';


abstract class CategoriesStates extends Equatable{

  @override
  List<Object>get props=>[];
}

class CategoriesInitialState extends CategoriesStates{}

class GetCategoriesLoadingState extends CategoriesStates{}
class GetCategoriesSuccessState extends CategoriesStates{


  final CategoryModel categoryModel;

  GetCategoriesSuccessState({required this.categoryModel});
  @override
  List<Object>get props=>[categoryModel];


}
class GetCategoriesErrorState extends CategoriesStates{


  final String msg;

  GetCategoriesErrorState({required this.msg});

  @override
  List<Object>get props=>[msg];
}


class GetCategoryProductsLoadingState extends CategoriesStates{}
class GetCategoryProductsSuccessState extends CategoriesStates{

  final CategoryDetailsModel categoryDetailsModel;

  GetCategoryProductsSuccessState({required this.categoryDetailsModel});
  @override
  List<Object>get props=>[categoryDetailsModel];
}
class GetCategoryProductsErrorState extends CategoriesStates{

  final String msg;

  GetCategoryProductsErrorState({required this.msg});

  @override
  List<Object>get props=>[msg];
}