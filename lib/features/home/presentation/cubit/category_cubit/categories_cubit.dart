import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/core/utils/app_strings.dart';
import 'package:supermarket/features/favourite/presentation/cubit/favourites_cubit.dart';
import 'package:supermarket/features/home/data/models/category_models/category_details_model.dart';
import 'package:supermarket/features/home/data/models/category_models/category_model.dart';
import 'package:supermarket/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:supermarket/features/home/domain/usecases/get_products_of_category_usecase.dart';
import 'package:supermarket/features/home/presentation/cubit/category_cubit/categories_states.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit(
      {required this.getCategoriesUseCase,
      required this.getProductOfCategoryUseCase})
      : super(CategoriesInitialState());

  GetCategoriesUseCase getCategoriesUseCase;

  GetProductOfCategoryUseCase getProductOfCategoryUseCase;

  CategoryModel? category = CategoryModel();

  Future<void> getCategoriesData() async {
    emit(GetCategoriesLoadingState());
    category = CategoryModel();
    Either<Failure, CategoryModel> response = await getCategoriesUseCase.call();
    emit(response.fold(
        (failure) => GetCategoriesErrorState(msg: _mapFailureToMsg(failure)),
        (categories) {
      category = categories;
      return GetCategoriesSuccessState(categoryModel: categories);
    }));
  }

  CategoryDetailsModel? categoryProducts = CategoryDetailsModel();

  Future<void> getCategoryProducts({required int? categoryId,required context}) async {
    emit(GetCategoryProductsLoadingState());
    categoryProducts = CategoryDetailsModel();
    Either<Failure, CategoryDetailsModel> response =
        await getProductOfCategoryUseCase.call(
            token: AppStrings.userToken, categoryId: categoryId);

    emit(response.fold(
        (failure) =>
            GetCategoryProductsErrorState(msg: _mapFailureToMsg(failure)),
        (categoryProducts){
          for (var product in categoryProducts.data!.categoryProducts!) {
            if (product.inFavorites) {
              BlocProvider
                  .of<FavouritesCubit>(context)
                  .favProducts
                  .add(product.id!);
            }
          }

          return GetCategoryProductsSuccessState(categoryDetailsModel:categoryProducts );
        }));
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Server Failure";
      case CacheFailure:
        return "Cache Failure";
      default:
        return " error";
    }
  }
}
