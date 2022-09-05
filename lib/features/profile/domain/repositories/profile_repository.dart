import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/login/data/models/login_model.dart';
import 'package:supermarket/features/profile/data/models/address_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserModel>> getProfile({required String? token});

  Future<Either<Failure, AddressModel>> getUserAddresses(
      {required String? token});

  Future<Either<Failure, UserModel>> updateUserData(
      {required String? token,
      required String name,
      required String email,
      required String phone});

  Future<Either<Failure, AddressModel>> addAddress({
    required String? token,
    required String addressName,
    required String city,
    required String region,
    required String details,
    required String notes,
    required int latitude,
    required int longitude,
  });
}
