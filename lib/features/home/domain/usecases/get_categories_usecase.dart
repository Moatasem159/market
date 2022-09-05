import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/home/data/models/category_models/category_model.dart';
import 'package:supermarket/features/home/domain/repositories/category_repository.dart';


class GetCategoriesUseCase{



  CategoryRepository categoryRepository;

  GetCategoriesUseCase({required this.categoryRepository});

  Future<Either<Failure, CategoryModel>> call()async{
    return categoryRepository.getCategoriesData();
  }
}