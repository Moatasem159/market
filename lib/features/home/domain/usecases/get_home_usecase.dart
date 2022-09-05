import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/home/data/models/home_model.dart';
import 'package:supermarket/features/home/domain/repositories/home_repository.dart';

class GetHomeUseCase{
  HomeRepository homeRepository;
  GetHomeUseCase({required this.homeRepository});
  Future<Either<Failure, HomeModel>> call({required String ?token}){
    return homeRepository.getHomeData(token: token);
  }
}