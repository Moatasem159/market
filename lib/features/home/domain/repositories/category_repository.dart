import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/home/data/models/category_models/category_details_model.dart';
import 'package:supermarket/features/home/data/models/category_models/category_model.dart';

abstract class CategoryRepository{

  Future<Either<Failure,CategoryModel>> getCategoriesData();
  Future<Either<Failure,CategoryDetailsModel>> getProductOfCategory({required String ?token,required int? categoryId});

}