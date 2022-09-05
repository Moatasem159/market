import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/exceptions.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/core/network/network_info.dart';
import 'package:supermarket/features/logout/data/data_sources/logout_data_source.dart';
import 'package:supermarket/features/logout/data/models/logout_model.dart';
import 'package:supermarket/features/logout/domain/repositories/logout_repository.dart';

class LogoutRepositoryImpl implements LogoutRepository{


  final NetworkInfo networkInfo;
  final LogoutDataSource logoutDataSource;

  LogoutRepositoryImpl({required this.networkInfo,required this.logoutDataSource});


  @override
  Future<Either<Failure, LogoutModel>> userLogout({required String? token})async {
    try{
      final response = await logoutDataSource.logout(token: token);
      return Right(response);
    }on ServerException{
      return Left(ServerFailure());
    }
  }





}