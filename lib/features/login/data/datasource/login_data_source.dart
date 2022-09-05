

import 'package:supermarket/core/api/api_consumer.dart';
import 'package:supermarket/core/api/end_points.dart';
import 'package:supermarket/features/login/data/models/login_model.dart';

abstract class LoginDataSource{


  Future<UserModel> login(
      {required String email,
        required String password});
  
}



class LoginDataSourceImpl implements LoginDataSource{

  ApiConsumer apiConsumer;

  LoginDataSourceImpl({required this.apiConsumer});
  
  @override
  Future<UserModel> login({required String email, required String password}) async{
    
    final response= await apiConsumer.post(
        EndPoints.login,
        body:{
          'email':email,
          'password':password,
        }
    );

    return UserModel.fromJson(response);
  }
  
  
  
  
  
}