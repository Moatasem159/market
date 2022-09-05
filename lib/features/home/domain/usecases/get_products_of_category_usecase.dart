import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/home/data/models/category_models/category_details_model.dart';
import 'package:supermarket/features/home/domain/repositories/category_repository.dart';

class GetProductOfCategoryUseCase{



  CategoryRepository categoryRepository;

  GetProductOfCategoryUseCase({required this.categoryRepository});

  Future<Either<Failure, CategoryDetailsModel>> call({required String ?token,required int ?categoryId})async{
    return categoryRepository.getProductOfCategory(token:token ,categoryId: categoryId);
  }
}