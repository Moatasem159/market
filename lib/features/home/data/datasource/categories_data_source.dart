import 'package:supermarket/core/api/api_consumer.dart';
import 'package:supermarket/core/api/end_points.dart';
import 'package:supermarket/features/home/data/models/category_models/category_details_model.dart';
import 'package:supermarket/features/home/data/models/category_models/category_model.dart';

abstract class CategoriesDataSource{


  Future<CategoryModel> getCategoriesData();
  Future<CategoryDetailsModel> getCategoryProducts({required String ?token, required int ? categoryId});
}


class CategoriesDataSourceImpl implements CategoriesDataSource{
  ApiConsumer apiConsumer;


  CategoriesDataSourceImpl({required this.apiConsumer});


  @override
  Future<CategoryModel> getCategoriesData() async{
    final response=await apiConsumer.get(EndPoints.categories);
    return CategoryModel.fromJson(response);
  }

  @override
  Future<CategoryDetailsModel> getCategoryProducts({required String? token, required int? categoryId}) async{
    final response=await apiConsumer.get("${EndPoints.categories}/$categoryId",token: token);
    return CategoryDetailsModel.fromJson(response);
  }











}