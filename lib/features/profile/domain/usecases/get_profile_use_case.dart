import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/login/data/models/login_model.dart';
import 'package:supermarket/features/profile/domain/repositories/profile_repository.dart';

class GetProfileUseCase{



  ProfileRepository profileRepository;

  GetProfileUseCase({required this.profileRepository});
  Future<Either<Failure,UserModel>>call({required String? token}){
    return profileRepository.getProfile(token: token);
  }


}