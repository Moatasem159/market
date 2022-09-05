import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/logout/data/models/logout_model.dart';
import 'package:supermarket/features/logout/domain/repositories/logout_repository.dart';

class LogoutUseCase{

  LogoutRepository logoutRepository;

  LogoutUseCase({required this.logoutRepository});


  Future<Either<Failure, LogoutModel>> call(
      {required String token}) {
    return logoutRepository.userLogout(token: token);
  }

}