import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/register/data/models/register_model.dart';
import 'package:supermarket/features/register/domain/repositories/register_repository.dart';


class RegisterUseCase {
  final RegisterRepository registerRepository;

  RegisterUseCase({required this.registerRepository});

  Future<Either<Failure, RegisterDataModel>> call(
      {required String email,
      required String password,
      required String name,
      required String phone}) {
    return registerRepository.userRegister(
      email: email,
      password: password,
      name: name,
      phone: phone);
  }
}
