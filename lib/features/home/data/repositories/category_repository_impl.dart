import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/exceptions.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/core/network/network_info.dart';
import 'package:supermarket/features/home/data/datasource/categories_data_source.dart';
import 'package:supermarket/features/home/data/models/category_models/category_details_model.dart';
import 'package:supermarket/features/home/data/models/category_models/category_model.dart';
import 'package:supermarket/features/home/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final NetworkInfo networkInfo;
  final CategoriesDataSource categoriesDataSource;

  CategoryRepositoryImpl(
      {required this.categoriesDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, CategoryModel>> getCategoriesData() async {
    try {
      final categories = await categoriesDataSource.getCategoriesData();
      return Right(categories);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CategoryDetailsModel>> getProductOfCategory({required String? token, required int? categoryId})async {
    try {
      final categoryData = await categoriesDataSource.getCategoryProducts(token: token, categoryId: categoryId);
      return Right(categoryData);
    } on ServerException {
      return Left(ServerFailure());
    }
  }


}
