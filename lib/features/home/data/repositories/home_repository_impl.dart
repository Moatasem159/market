import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/exceptions.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/core/network/network_info.dart';
import 'package:supermarket/features/home/data/datasource/home_data_source.dart';
import 'package:supermarket/features/home/data/models/home_model.dart';
import 'package:supermarket/features/home/domain/repositories/home_repository.dart';


class HomeRepositoryImpl implements HomeRepository {
  final NetworkInfo networkInfo;
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl(
      {required this.networkInfo,
      required this.homeDataSource});

  @override
  Future<Either<Failure, HomeModel>> getHomeData(
      {required String? token}) async {
    try {
      final home = await homeDataSource.getHomeData(token: token);
      return Right(home);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

}
