import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/profile/data/models/address_model.dart';
import 'package:supermarket/features/profile/domain/repositories/profile_repository.dart';

class GetUserAddressesUseCase{


  ProfileRepository profileRepository;
  GetUserAddressesUseCase({required this.profileRepository});


  Future<Either<Failure,AddressModel>> call({required String ?token}){
    return profileRepository.getUserAddresses(token: token);
  }
}