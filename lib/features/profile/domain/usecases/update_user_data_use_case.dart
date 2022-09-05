import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/login/data/models/login_model.dart';
import 'package:supermarket/features/profile/domain/repositories/profile_repository.dart';

class UpdateUserDataUserCase{


  ProfileRepository profileRepository;

  UpdateUserDataUserCase({required this.profileRepository});


  Future<Either<Failure,UserModel>> call({
    required String? token,
    required String name,
    required String email,
    required String phone}){
    return profileRepository.updateUserData(token: token, name: name, email: email, phone: phone);
  }
}