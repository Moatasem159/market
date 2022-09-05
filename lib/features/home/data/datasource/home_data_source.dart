

import 'package:supermarket/core/api/api_consumer.dart';
import 'package:supermarket/core/api/end_points.dart';
import 'package:supermarket/features/home/data/models/home_model.dart';

abstract class HomeDataSource{


  Future<HomeModel> getHomeData({required String ?token});
}


class HomeDataSourceImpl implements HomeDataSource{
  ApiConsumer apiConsumer;


  HomeDataSourceImpl({required this.apiConsumer});

  @override
  Future<HomeModel> getHomeData({required String ?token})async{
    final response=await apiConsumer.get(EndPoints.home,token: token);
    return HomeModel.fromJson(response);
  }





}