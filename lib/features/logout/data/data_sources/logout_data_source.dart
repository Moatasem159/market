import 'package:supermarket/core/api/api_consumer.dart';
import 'package:supermarket/core/api/end_points.dart';
import 'package:supermarket/features/logout/data/models/logout_model.dart';

abstract class LogoutDataSource{


  Future<LogoutModel> logout(
      {required String ?token});

}

class LogoutDataSourceImpl implements LogoutDataSource{
  ApiConsumer apiConsumer;

  LogoutDataSourceImpl({required this.apiConsumer});

  @override
  Future<LogoutModel> logout({required String? token})async {
   final response=await apiConsumer.post(EndPoints.logout,token: token);
   return LogoutModel.fromJson(response);
  }





}