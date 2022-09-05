

import 'package:supermarket/core/api/api_consumer.dart';
import 'package:supermarket/core/api/end_points.dart';
import 'package:supermarket/features/register/data/models/register_model.dart';

abstract class RegisterDataSource{


  Future<RegisterDataModel> register(
      {required String email,
    required String password,
    required String name,
    required String phone});
}



class RegisterDataSourceImpl implements RegisterDataSource{


  ApiConsumer apiConsumer;


  RegisterDataSourceImpl({required this.apiConsumer});

  @override
  Future<RegisterDataModel> register({
    required String email,
    required String password,
    required String name,
    required String phone}) async{

    final response = await apiConsumer.post(
      EndPoints.register,
      body: {
        'email':email,
        'password':password,
        'name':name,
        'phone':phone,
      }
    );
    return RegisterDataModel.fromJson(response);
  }



}