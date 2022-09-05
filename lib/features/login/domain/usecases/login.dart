import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/login/data/models/login_model.dart';
import 'package:supermarket/features/login/domain/repositories/login_repository.dart';


class LoginUseCase{


  final LoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});


  Future<Either<Failure, UserModel>> call(
      {required String email,
        required String password}) {
    return loginRepository.userLogin(
        email: email,
        password: password,);
  }
}