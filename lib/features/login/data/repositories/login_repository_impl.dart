import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/exceptions.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/core/network/network_info.dart';
import 'package:supermarket/features/login/data/datasource/login_data_source.dart';
import 'package:supermarket/features/login/data/models/login_model.dart';
import 'package:supermarket/features/login/domain/repositories/login_repository.dart';


class LoginRepositoryImpl implements LoginRepository{


  final NetworkInfo networkInfo;
  final LoginDataSource loginDataSource;

  LoginRepositoryImpl({required this.networkInfo, required this.loginDataSource});



  @override
  Future<Either<Failure, UserModel>> userLogin({
    required String email,
    required String password}) async{
    try{
      final login = await loginDataSource.login(
          email: email, password: password);
      return Right(login);
    }on ServerException{
      return Left(ServerFailure());
    }
  }



}