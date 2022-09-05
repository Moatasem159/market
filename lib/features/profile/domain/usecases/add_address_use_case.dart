import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/profile/data/models/address_model.dart';
import 'package:supermarket/features/profile/domain/repositories/profile_repository.dart';

class AddAddressUseCase{



  ProfileRepository profileRepository;

  AddAddressUseCase({required this.profileRepository});


  Future<Either<Failure,AddressModel>> call({
    required String? token,
    required String addressName,
    required String city,
    required String region,
    required String details,
    required String notes,
    required int latitude,
    required int longitude,}){
    return profileRepository.addAddress(
        token: token,
        addressName: addressName,
        city: city,
        region: region,
        details: details,
        notes: notes,
        latitude: latitude,
        longitude: longitude);
  }
}