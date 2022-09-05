
import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/logout/data/models/logout_model.dart';

abstract class LogoutRepository{



  Future<Either<Failure,LogoutModel>> userLogout({
    required String ?token});
}