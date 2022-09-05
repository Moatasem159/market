import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/exceptions.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/core/network/network_info.dart';
import 'package:supermarket/features/register/data/datasource/register_data_source.dart';
import 'package:supermarket/features/register/data/models/register_model.dart';
import 'package:supermarket/features/register/domain/repositories/register_repository.dart';


class RegisterRepositoryImpl implements RegisterRepository {


  final NetworkInfo networkInfo;

  final RegisterDataSource registerDataSource;

  RegisterRepositoryImpl(
      {required this.registerDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, RegisterDataModel>> userRegister({required String email,
    required String password,
    required String name,
    required String phone}) async {
    try{
      final register = await registerDataSource.register(
          email: email, password: password, name: name, phone: phone);
      return Right(register);
    }on ServerException{
      return Left(ServerFailure());
    }
  }
}