import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/exceptions.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/core/network/network_info.dart';
import 'package:supermarket/features/login/data/models/login_model.dart';
import 'package:supermarket/features/profile/data/data_sources/profile_data_source.dart';
import 'package:supermarket/features/profile/data/models/address_model.dart';
import 'package:supermarket/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final NetworkInfo networkInfo;
  final ProfileDataSource profileDataSource;

  ProfileRepositoryImpl(
      {required this.networkInfo, required this.profileDataSource});

  @override
  Future<Either<Failure, UserModel>> getProfile(
      {required String? token}) async {
    try {
      final profile = await profileDataSource.getProfile(token: token);
      return Right(profile);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AddressModel>> getUserAddresses(
      {required String? token}) async {
    try {
      final addresses = await profileDataSource.getUserAddresses(token: token);
      return Right(addresses);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AddressModel>> addAddress(
      {required String? token,
      required String addressName,
      required String city,
      required String region,
      required String details,
      required String notes,
      required int latitude,
      required int longitude}) async {
    try {
      final addresses = await profileDataSource.addAddress(
          token: token,
          addressName: addressName,
          city: city,
          region: region,
          details: details,
          notes: notes,
          latitude: latitude,
          longitude: longitude);
      return Right(addresses);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateUserData(
      {required String? token,
      required String name,
      required String email,
      required String phone}) async {
    try {
      final update = await profileDataSource.updateUserData(
          token: token, name: name, email: email, phone: phone);
      return Right(update);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
