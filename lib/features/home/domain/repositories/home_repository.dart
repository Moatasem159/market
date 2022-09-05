import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/home/data/models/home_model.dart';


abstract class HomeRepository{


  Future<Either<Failure,HomeModel>> getHomeData({required String ?token});

}