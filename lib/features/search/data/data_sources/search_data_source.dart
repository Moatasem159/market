import 'package:supermarket/core/api/api_consumer.dart';
import 'package:supermarket/core/api/end_points.dart';
import 'package:supermarket/features/search/data/models/search_model.dart';

abstract class SearchDataSource{

  Future<SearchModel> search({required String ?token,required String text});
}


class SearchDataSourceImpl implements SearchDataSource{

  ApiConsumer apiConsumer;
  SearchDataSourceImpl({required this.apiConsumer});

  @override
  Future<SearchModel> search({required String? token, required String text})async {

    final response=await apiConsumer.post(EndPoints.search,token: token,body: {'text': text,});
    return SearchModel.fromJson(response);
  }





}