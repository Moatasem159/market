import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/login/data/models/login_model.dart';


abstract class LoginRepository{



  Future<Either<Failure,UserModel>> userLogin({
    required String email,
    required String password});
}