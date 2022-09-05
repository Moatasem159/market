import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/register/data/models/register_model.dart';

abstract class RegisterRepository{




  Future<Either<Failure,RegisterDataModel>> userRegister({required String email,
    required String password,
    required String name,
    required String phone});

}